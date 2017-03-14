#!/bin/sh
#Version 1.4
#Todd Houle
#20Jan2016
#10Feb2016
#5May2016  #installation now quits the LL App Update Tool gui program - so it's not showing out of date content


#Update Icon
icon="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"

#Rotated Update Icon
icon2="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"


bitBarPath=$(defaults read /Library/Preferences/com.matryer.BitBar.plist pluginsDirectory)
notify(){
    message=$1

    if [ -f /Applications/Utilities/BitBar.app/Contents/MacOS/BitBar ] && [ -f $bitBarPath/LLAppStatus.20m.sh ]; then
        echo "$message |image=$icon2 dropdown=false size=11" > /tmp/installStatus.txt
	echo "Updates in Progress... |image=$icon dropdown=false size=11" >> /tmp/installStatus.txt
	echo "---" >> /tmp/installStatus.txt
	echo "$message... |image=$icon size=11" >>  /tmp/installStatus.txt
	echo "One moment, please |size=11" >> /tmp/installStatus.txt
	open -g bitbar://refreshPlugin?name=*
	if [ $? -ne 0 ]; then
	    killall BitBar
	    psToKill=`ps auxw |grep -v grep |grep BitBar |awk '{print $2}'`
	    kill $psToKill
	    open -g bitbar://refreshPlugin?name=*
	fi
    else
	/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -title App_Updates -description "$message" -windowPosition ll -icon /usr/local/Logos/logo.png&
    fi
    logger "LLUpdate: $message"
}

CheckForNetwork(){
# Determine if the network is up by looking for any non-loopback network interfaces.                                                                                            
    local test

    if [[ -z "${NETWORKUP:=}" ]]; then
        test=$(ifconfig -a inet 2>/dev/null | sed -n -e '/127.0.0.1/d' -e '/0.0.0.0/d' -e '/inet/p' | wc -l)
        if [[ "${test}" -gt 0 ]]; then
            NETWORKUP="-YES-"
        else
            NETWORKUP="-NO-"
            notify "No Network Avail."
	    sleep 9
	    rm /tmp/installStatus.txt
	    rm /usr/local/updateTool/updateToolTouchFiles/*
	    exit
        fi
    fi
}
CheckSiteNetwork(){
	jssURL=$(defaults read /Library/Preferences/com.jamfsoftware.jamf.plist jss_url|awk -F/ '{print $3}'|awk -F: '{print $1}')
    ping=`host -W .5 $jssURL`
    result=$?
    if [ $result == "1" ]; then
        notify "No Local Network Avail."
	sleep 9
        rm /tmp/installStatus.txt
        rm /usr/local/updateTool/updateToolTouchFiles/*
        open -g bitbar://refreshPlugin?name=*
	exit
    fi
}

#############################  START

#refresh bitbar
open -g bitbar://refreshPlugin?name=*
if [ $? -ne 0 ]; then
    killall BitBar
    open -g bitbar://refreshPlugin?name=*
fi
logger  "Bitbar Refreshed"


CheckForNetwork
CheckSiteNetwork

#wait if another instance of script is running
if [ -d /tmp/myscript.lock ]; then
    logger "LLUpdate Another instance of the Installer is already running."
    exit 1
fi

mkdir /tmp/myscript.lock 2>/dev/null

killall "LL App Update Tool"

#####################################
sleep 3
SAVEIFS=$IFS
fileList=`ls -m /usr/local/updateTool/updateToolTouchFiles/`

rebootflag="NO"
IFS=","

for oneFileWithWhiteSpace in $fileList; do
    oneFile="$(echo "$oneFileWithWhiteSpace" | sed -e 's/^[[:space:]]*//'|tr -d '\n')"
    source=`echo $oneFile |awk -F+ '{print $1}'`
    policy=`echo $oneFile |awk -F+ '{print $2}' | sed 's/,//g'`
    rebootNeeded=`echo $oneFile |awk -F+ '{print $3}' | sed 's/,//g'`
    if [ "$policy" = "updateapps4" ]; then
	notify "Refreshing list of available updates...."
	/usr/local/jamf/bin/jamf recon
	/usr/local/jamf/bin/jamf policy -event updateApps4
    	ranUpdateApps="nope"
    else
	notify "Installing $policy...."
	
	if [[ "$rebootNeeded" == "rebootYes" ]]; then
	    rebootflag="YES"
	    logger "LLUpdate:Reboot Flag set: $policy"
	fi
	
	logger "LLUpdate:installing: $policy via $source"
	if [ $source == "JSS" ]; then
	    /usr/local/jamf/bin/jamf policy -event "$policy" 
	elif [ $source == "Apple" ]; then
	    /usr/sbin/softwareupdate -i "$policy"
	elif [ $source == "Adobe" ]; then
	    /usr/local/bin/RemoteUpdateManager --channelIds=$policy
	else
	    logger "LLUpdate: ERROR: $source is not a recognized source"
	fi
    fi
    /usr/bin/pkill jamfHelper
    rm "/usr/local/updateTool/updateToolTouchFiles/$oneFileWithWhiteSpace"
done


IFS=$SAVEIFS
#Clean up - Clean up.  Everybody do their share
notify "Finalizing Updates..."
rm -f /usr/local/updateTool/updateToolTouchFiles/*
sleep 2

#refresh
if [ "$ranUpdateApps" == "nope" ]; then
    logger "LLUpdates:Running only refresh. Nothing installed."
else
    /usr/local/jamf/bin/jamf recon
    /usr/local/jamf/bin/jamf policy -event updateApps4
fi

/usr/bin/pkill jamfHelper

if [[ "$rebootflag" == "YES" ]]; then
    notify "Updates Complete- Rebooting...."
    logger "LLUpdate:Updates complete.  Rebooting"
    sleep 4
    rm /usr/local/updateTool/updaterInfo.txt 
    rm /usr/local/updateTool/updaterInfo-holder.txt
    reboot
else
    notify "Updates Complete!"
    logger "LLUpdate:Updates Complete. Exiting"
    sleep 10
    /usr/bin/pkill jamfHelper
fi

#remove one at a time lock file
rm -rf /tmp/myscript.lock

#turn off BitBar Notifications
rm /tmp/installStatus.txt
open -g bitbar://refreshPlugin?name=*
if [ $? -ne 0 ]; then
    killall BitBar
    open -g bitbar://refreshPlugin?name=*
fi
