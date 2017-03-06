#!/bin/sh
#Todd Houle
#Mar 2016
# to check for pending updates  in /usr/local/updateTool/updaterInfo.txt
# and open GUI if needed

bitBarPath=$(defaults read /Library/Preferences/com.matryer.BitBar.plist pluginsDirectory)

CheckForNetwork(){
# Determine if the network is up by looking for any non-loopback network interfaces.   

    local test

    if [[ -z "${NETWORKUP:=}" ]]; then
        test=$(ifconfig -a inet 2>/dev/null | sed -n -e '/127.0.0.1/d' -e '/0.0.0.0/d' -e '/inet/p' | wc -l)
        if [[ "${test}" -gt 0 ]]; then
            NETWORKUP="-YES-"
        else
            NETWORKUP="-NO-"
        fi
    fi
}

writeToLog(){
    logger "LLUpdate: $1"
}

checkFileForUpdates(){
    updatesNeeded=`cat /usr/local/updateTool/updaterInfo.txt`
    if [ ! -z "$updatesNeeded" ]; then
        return 0
    else
        return 1
    fi
}

##############################################
#wait if another instance of script is running
if [ -d /tmp/myscript.lock ]; then
    writeToLog "Another instance of the Installer is already running. popup closing."
    exit 1
fi

#keep BitBar in sync
if [ -f /Applications/Utilities/BitBar.app/Contents/MacOS/BitBar ] && [ -d $bitBarPath ]; then
    open -g bitbar://refreshPlugin?name=*
fi

#pause if root is logged in, give the user time to get started if just booted
currentUser=`stat -f '%Su' /dev/console`
if [ "$currentUser" == "root" ]; then
    sleep 180
fi

checkFileForUpdates
needed=$?
if [ $needed == 0 ]; then
    writeToLog "Updates Needed.  Not checking for overdue."
        currentUser=`stat -f '%Su' /dev/console`
        if [ "$currentUser" != "root" ]; then

           #Check-For-Network                                                                                                                                                                
	    i=1
	    while [[ "${NETWORKUP}" != "-YES-" ]] && [[ $i -ne 720 ]]
	    do
		sleep 5
		NETWORKUP=
		CheckForNetwork
		echo $i >/dev/null
		i=$(( $i + 1 ))
	    done
	    
            open /Applications/Utilities/LL\ App\ Update\ Tool.app
        fi
else
    writeToLog "No Updates needed.  Closing"
    exit 0
fi

