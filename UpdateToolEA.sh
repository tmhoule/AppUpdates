#!/bin/sh                                                                                                                                                                                                                                        
# Todd Houle                                                                                                                                                                                                                                     
# 16Mar2016                                                                                                                                                                                                                                      
# MITLL                                                                                                                                                                                                                                          
# This script determines if the LL App Update Tool has been edited on the client machine and if it is running properly.  If you modify any scripts or launchdaemons, then create a new MD5 and enter it on the appropriate line below.                                                                                                                          



###  THESE ARE THE OK MD5's.                                                                                                                                                                                                                     
# If the scripts are edited, the MD5 here needs to be changed                                                                                                                                                                                    
# use "/sbin/md5 /path/to/script" to determine appropriate MD5 code.                                                                                                                                                                             
###                                                                                                                                                                                                                                              

updateInstaller=34394d638b492cf06a6153194e119619
updateKicker_popup=226a22d65c14e1171f5094689a7b525e
updateKicker_overdue=134c795c9659467a39df7b1a45d2feca



### THESE ARE THE OK MD5's FOR THE LAUNCHDAEMONS                                                                                                                                                                                                 
# If you edit a LaunchD, calculate a new MD5 for it                                                                                                                                                                                              
# use "/sbin/md5 /Library/LaunchDaemon/edu.mit.edited.plist                                                                                                                                                                                      
###                                                                                                                                                                                                                                              

updateToolInstaller_plist=9b6bbc6c3c680938cdbae3e19880b73a
updateToolKickerGUI_plist=41dfab5bca25f70d642f7aa384dce8be
updateToolKickerOD_plist=2784206a5b4015a4232898b85143057b


#########################################                                                                                                                                                                                                        
######## Don't Mess with Below ##########                                                                                                                                                                                                        
#########################################                                                                                                                                                                                                        

if [ ! -f /usr/local/updateTool/updateInstaller.sh ] ||  [ ! -f /usr/local/updateTool/updateKicker-popup.sh ] || [ ! -f /usr/local/updateTool/updateKicker-overdue.sh ]; then
    md5Stuats="Missing"
else
    mdInstaller=`/sbin/md5 -q /usr/local/updateTool/updateInstaller.sh`
    mdkickerGUI=`/sbin/md5 -q /usr/local/updateTool/updateKicker-popup.sh`
    mdkickerOD=`/sbin/md5 -q /usr/local/updateTool/updateKicker-overdue.sh`

    if [[ $mdInstaller != $updateInstaller ]] || [[ $updateKicker_popup != $mdkickerGUI ]] || [[ $updateKicker_overdue != $mdkickerOD ]]; then
        md5Stuats="MD5 Error"
    else
        echo "MD5s are ok"
        md5Stuats="Good"
    fi
fi

#####                                                                                                                                                                                                                                            

if [ ! -f /Library/LaunchDaemons/edu.mit.ll.updateToolInstaller.plist ] || [ ! -f /Library/LaunchDaemons/edu.mit.ll.updateToolKickerGUI.plist ] || [ ! -f /Library/LaunchDaemons/edu.mit.ll.updateToolKickerOverDue.plist ]; then
    launchDmd5="Missing"
else
    mdLaunchDInstall=`/sbin/md5 -q /Library/LaunchDaemons/edu.mit.ll.updateToolInstaller.plist`
    md5LaunchDGUI=`/sbin/md5 -q /Library/LaunchDaemons/edu.mit.ll.updateToolKickerGUI.plist`
    md5LaunchDOD=`/sbin/md5 -q /Library/LaunchDaemons/edu.mit.ll.updateToolKickerOverDue.plist`

    if [[ $updateToolInstaller_plist != $mdLaunchDInstall ]] || [[ $updateToolKickerGUI_plist != $md5LaunchDGUI ]] || [[ $updateToolKickerOD_plist != $md5LaunchDOD ]]; then
        launchDmd5="Modified"
    else
        launchDmd5="Good"
    fi
fi

######                                                                                                                                                                                                                                           

launchInstallOK=`launchctl list edu.mit.ll.updateToolInstaller`
launchKickerGUI=`launchctl list edu.mit.ll.updateToolKickerGUI`
launchKickerOD=`launchctl list edu.mit.ll.updateToolKickerOverDue`

if [[ -z $launchInstallOK ]] || [[ -z $launchKickerGUI ]] || [[ -z $launchKickerOD ]]; then
    launchDStatus="Not Running"
else
    echo "launchDs are running OK"
    launchDStatus="Running"
fi


##########                                                                                                                                                                                                                                       
if [[ $launchDStatus == "Running" ]] && [[ $md5Stuats == "Good" ]] && [[ $launchDmd5 == "Good" ]]; then
    echo "<result>Running OK</result>"
else
    echo "<result>LaunchD: $launchDStatus | Scripts-MD5: $md5Stuats  |  LaunchD-MD5: $launchDmd5</result>"
fi
