#!/bin/sh
# LL Software Update Tool
# Todd Houle
# Dec 2015
# writes updates needed to $datafile
# That file is read in with the GUI tool


#File name of config should be supplied as fourth parameter (ie: ./JssPolicy.sh x y z config.plist)
#If run via JSS Policy, this should be first parameter box when running the script via Policy

################################
#Configuration
################################

#Server and path to get config file from. 
configServer="http://serverName.mit.edu/UpdateToolConfigs/"


#################################
#Dont Edit Below
#################################

datafile="/usr/local/updateTool/updaterInfoTEMP.txt"

#Version Comparison Routine
vercomp () {
#    echo "Starting: $1 $2"
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros 
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]})); then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

update(){
    # Rename function arguments for easier reference 
    appName="$1" # Application Friendly Name
    latestVersion="$2" #The latest version of the app on the server
    installPolicy="$3"   #The name of the JSS policy to run to install the cached package
    installBy="$4"  #The date the update will be autoinstalled if not done yet.
    minVers="$5" #Versions below this will be ignored 
    appPath="$6" #path to the app, as defined in the config file
    appBundleName=$(defaults read "$appPath/Contents/Info.plist" CFBundleName)
    if [ -z "$appBundleName" ]; then
	appBundleName="NotInstalled"
    fi
    echo "DEBUG: Begin $appName"
    
    #build list of versions of app which will not be patched (appPath doesn't match defined path)
#    unpatchedApps=$(/usr/bin/mdfind "kind:application" $appName)
    unpatchedApps=$(/usr/bin/mdfind "kMDItemDisplayName=='$appName'&&kMDItemContentType=='com.apple.application-bundle'")
    while read -r line; do
	echo "DEBUG: line is $line"
	if [ ! -z "$line" ]; then   #if line is not blank (app not installed)
	    if [ ! "$appPath" == "$line" ]; then   
		echo "--$appName - $line - version: $thisAppVersion (latest:$latestVersion)|color=black" >> /usr/local/updateTool/unpatchedAppList.txt
   	    fi
	fi
    done <<< "$unpatchedApps"
    
    #skip if not installed
    if [ ! -d "$appPath" ]; then
	logger "LLUpdate: $appName is not installed. Couldn't find $appPath"
	return
    fi
    
    # Define version installed on local machine
    installedVersion=`defaults read "$appPath/Contents/Info.plist" CFBundleShortVersionString`
    
    
    if [ ! -z "$minVers" ]; then
	vercomp $minVers $latestVersion
	minOK=$?
	if [ $minOK == 1 ]; then
	    logger "LLUpdate: $appName does not meet minimum version requirement. Skipping"
	    return
	else
	    logger "LLUpdate: $appName passes minimum version requirement."
	fi
    fi
    
         #find out which is newer, server (listed below) or what is on client machine.
    if [[ $installedVersion =~ [A-z] ]] || [[ $installedVersion = "" ]]; then
	logger "LLUpdate: ERROR - $appName version contains unsupported text: $versionString"
	return
    else
	vercomp $latestVersion $installedVersion
	newerApp=$?
    fi
    
    # If newer version is available, do this stuff.
    if [ $newerApp == 1 ]; then
	     # An update is available. Record it for the GUI
	logger "LLUpdate: update for $appName is available"
	echo "{source:\"JSS\",appName:\"$appName\",appVersion:\"$latestVersion\",jssPolicy:\"$installPolicy\",dueDate:\"$installBy\",appInstallChk:true,reboot:false}" >> $datafile
    elif [ $newerApp == 2 ]; then
	logger "LLUpdate: User has a newer version of $appName than on the server. Do Nothing"
    elif [ $newerApp == 0 ]; then
	logger "LLUpdate: User has same version of $appName as is installed.  Do Nothing."
    else
	logger "LLUpdate: ERROR: Unknown Error occured comparing version on $appName.  You have $installedVersion and the latest is $latestVersion."
    fi
    
    unset appPath
    unset appName
    unset latestVersion
    unset installPolicy
    unset installBy
    
}

checkAppleUpdates(){
    echo "Checking for Apple Updates"
    updateList=`softwareupdate -l 2>&1 |grep -v "Finding available software"` #2>&1 redirects stderr to stdout so it'll be available to grep.  No New software available is a STDERR message instead of STDOUT
    nextWeek=`date -v +1d +%m-%d-%Y`
    updatesNeeded=`echo "$updateList" |grep "No new software available"`
    hasError=`echo $updateList |grep "load data from the Software Update server"`
    
    `echo "$updateList" > /tmp/appleSWupdates.txt`
    
    if [[ ! $updatesNeeded =~ "No new software available" ]]; then
	if [[ ! $hasError =~ "Can't load data from the Software Update server" ]]; then
	    updateMiniList=`echo "$updateList" |grep \*`   #gives list of updates with no other crap   
	    echo "$updateMiniList"| while read line;do
		jssPolicy=`echo "$line" |sed 's/\* //g'`
		appNameWithWhiteSpace=`echo "$updateList" |grep -A1 "$jssPolicy"|tail -1|awk -F\( '{print $1}'`
		appName="$(echo "${appNameWithWhiteSpace}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
		latestVersion=`echo "$updateList" |grep -A1 "$jssPolicy"|tail -1|awk -F\( '{print $2}'|awk -F\) '{print $1}'`
		fixedPolicy=$(defaults read /tmp/ApplicationUpdateControl.plist |awk -F= '/{/{print $1}'|grep "$jssPolicy")
		if [ ! -z "$fixedPolicy" ]; then
		    dueDateApple=$(defaults read /tmp/ApplicationUpdateControl.plist "$jssPolicy"|awk -F= '/DueDate/{print $2}'|sed 's/;//'|sed 's/"//g'| sed -e 's/^[[:space:]]*//')
		    dueDateSwapped=`echo "$dueDateApple" | sed 's/+0000/GMT/'`
		    installBy=$(date -j -f "%Y-%m-%d %H:%M:%S %Z" "$dueDateSwapped" +"%m-%d-%Y %H:%M")
		else
		    installBy="$nextWeek 23:30"
		fi	
		rebootNeeded=`echo "$updateList" |grep -A1 "$jssPolicy"|tail -1|grep restart`
		existsAlready=`cat /usr/local/updateTool/updaterInfo-holder.txt |grep "$jssPolicy"`
		if [[ -z $rebootNeeded ]]; then
		    rebootStatus=false
		else
		    rebootStatus=true
		fi
		
		if [[ -z $existsAlready ]]; then
		    echo "{source:\"Apple\",appName:\"$appName\",appVersion:\"$latestVersion\",jssPolicy:\"$jssPolicy\",dueDate:\"$installBy\",appInstallChk:true,reboot:$rebootStatus}" >> $datafile
		else
		    echo "$existsAlready" >> $datafile
		fi
	    done
	fi
    fi
    unset fixedPolicy
    unset installBy
}

checkforAdobeUpdates(){
    nextWeek=`date -v +1d +%m-%d-%Y`
    installBy=$(defaults read /tmp/ApplicationUpdateControl.plist $jssPolicy)
    if [ -z "$installBy" ]; then
        dueDateApple=$(defaults read /tmp/ApplicationUpdateControl.plist "$line"|awk -F= '/DueDate/{print $2}'|sed 's/;//'|sed 's/"//g'| sed -e 's/^[[:space:]]*//')
        dueDateSwapped=`echo "$dueDateApple" | sed 's/+0000/GMT/'`
        installBy=$(date -j -f "%Y-%m-%d %H:%M:%S %Z" "$dueDateSwapped" +"%m-%d-%Y %H:%M")
    else
        installBy="$nextWeek 23:30"
    fi

    coolRUM=`$RUM --help 2>&1 |grep action`
    
    if [[ -z $coolRUM ]];then
	logger "LLUpdate: Old version of RUM"
    else
        updates=`$RUM --action=list |grep /`
        updatesArray=( $updates )
        for eachUpdate in ${updatesArray[@]}; do
            updateClean=`echo $eachUpdate |awk -F/ '{print $1}'|tr -d \(`
            adobeExistsAlready=`cat /usr/local/updateTool/updaterInfo-holder.txt |grep $updateClean`
            if [[ -z $adobeExistsAlready ]]; then
                echo "{source:\"Adobe\",appName:\"$updateClean\",appVersion:\"...\",jssPolicy:\"$updateClean\",dueDate:\"$installBy\",appInstallChk:true,reboot:false}" >> $datafile
            else
                echo "$adobeExistsAlready" >> $datafile
            fi
        done
    fi  
}


######################################### Main App Starts Here
######################################### 
######################################### 
######################################### 

#clear unpatchedAppList
rm  /usr/local/updateTool/unpatchedAppList.txt
touch  /usr/local/updateTool/unpatchedAppList.txt

#get config file containing updates from server
logger "LLUpdate: Getting config $configServer$4"
if [ ! -z $4 ]; then
	curl -so /tmp/ApplicationUpdateControl.plist $configServer/$4
	if [ ! -f /tmp/ApplicationUpdateControl.plist ]; then
		echo "No config file available.  Exiting."
		exit 1
	fi
else
	logger "LLUpdate: ERROR Config file from server not specified.  Enter as param 4"
	echo "ERROR Config file from server not specified.  Enter as param 4. If running locally, type ./JssPolicy.sh x y z ConfigFileName.plist"
	exit 1
fi


#clean updaterInfo txt file
if [ ! -d /usr/local/updateTool/updateToolTouchFiles ]; then
    mkdir -p /usr/local/updateTool/updateToolTouchFiles
    chmod ugo+rwx /usr/local/updateTool/updateToolTouchFiles
fi
rm $datafile
touch $datafile

policiesToCheck=$(defaults read /tmp/ApplicationUpdateControl.plist |awk -F= '/{/{print $1}'|grep -v "{"|sed 's/"//g')
while read -r line; do
    dueDateApple=$(defaults read /tmp/ApplicationUpdateControl.plist "$line"|awk -F= '/DueDate/{print $2}'|sed 's/;//'|sed 's/"//g'| sed -e 's/^[[:space:]]*//')
    dueDate=$(date -j -f "%Y-%m-%d %H:%M:%S %z" "$dueDateApple" +"%m-%d-%Y %H:%M")
    appPath=$(defaults read /tmp/ApplicationUpdateControl.plist "$line"|awk -F= '/Path/{print $2}' | sed 's/"//g'|sed 's/;//'|sed -e 's/^[[:space:]]*//')
    installPolicy=$(defaults read /tmp/ApplicationUpdateControl.plist "$line"|awk '/InstallPolicy/{print $3}' | sed 's/;//')
    source=$(defaults read /tmp/ApplicationUpdateControl.plist "$line"|awk '/Source/{print $3}'|sed 's/;//')
    latestVer=$(defaults read /tmp/ApplicationUpdateControl.plist "$line"|awk '/LatestVersion/{print $3}'|sed 's/;//'|sed 's/"//g')
    minVers=$(defaults read /tmp/ApplicationUpdateControl.plist  "$line"|awk '/MinimumVersion/{print $3}'|sed 's/;//'|sed 's/"//g')
    if [ "$source" == "JSS" ]; then
#		echo "Executing JSS update on: \"$line\" \"$latestVer\" \"$installPolicy\" \"$dueDate\" \"$minVers\" \"$appPath\"  "
		update "$line" "$latestVer" "$installPolicy" "$dueDate" "$minVers" "$appPath"
    fi
done <<< "$policiesToCheck"

# Check for Apple Software
checkAppleUpdates

# check for Adobe software
RUM="/usr/local/bin/RemoteUpdateManager"
if [ ! -f "$RUM" ]; then
    echo "Adobe RUM is not installed on this computer"
    logger "LLUpdate: Adobe RUM is not installed on this computer. Won't check for Adobe CC Updates."
else
    checkforAdobeUpdates
    $RUM --action=download
fi

#backup the File
cat $datafile |uniq > /usr/local/updateTool/updaterInfo.txt
cp $datafile /usr/local/updateTool/updaterInfo-holder.txt

echo "Current updaterInfo.txt file"
cat $datafile
