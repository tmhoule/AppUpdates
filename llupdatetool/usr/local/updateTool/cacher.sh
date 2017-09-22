#!/bin/sh
#Todd
#22Sept2017
#To cache download installers

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
    updatesNeeded=`cat /usr/local/updateTool/updaterInfoPreCache.txt`
    if [ ! -z "$updatesNeeded" ]; then
        return 0
    else
        return 1
    fi
}

###########
checkFileForUpdates
needed=$?
if [ $needed == 0 ]; then
    while read line; do
        dueDate=`echo "$line" |awk -FdueDate:\" '{print $2}' | awk -F\" '{print $1}'`

    done </usr/local/updateTool/updaterInfo.txt
fi
