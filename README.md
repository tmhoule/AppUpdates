###NOTE: View the quickstart guide for a quick tutorial.  (https://github.com/tmhoule/AppUpdates/blob/master/QUICKSTART.md)
___________________________
###About:
This suite of tools allows a Jamf JSS to manage application updates on workstations in your environment.  It can do version comparisons and force updates after a set period of time.

![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/AppGUIimage.png)

____________________________
###Components:
**ScanForUpdates.sh**: This script runs via the Casper management server on each workstation.  It downloads the config file named in parameter 4 from the URL (configServer line 17) and scans the computer for applications listed in that file.  It will then record any applicable update required into its a data file /usr/local/updateTool/updaterInfo.txt.  

**DEVApplicationUpdateControl.plist**: An example config file.  Xcode is the recommended editor.  This file contains each application to scan for on the local machine.  Acceptable parameters are: Source, InstallPolicy, LatestVersion, DueDate, Path
	
An entry is NOT required for Apple or Adobe RUM updates.  The due date will be automatically set to 11:30PM the day after the update is first seen by the computer.  If you'd like the update required sooner, enter the exact name of the Apple update and use a Source of Apple and DueDate.  
	
**build.sh**: basic shell script to create an installer package to distribute to clients. Or use the PKG in the repo, no customization needed.  Below is what is included in the client package.

 llupdatetool: main directory of source code.
* Applications: Utilities: LL App Update Tool.app -  This is the GUI application for end users to list applicable updates on their computer.  They can install updates and force a refresh of required updates.
* Library: LaunchAgents: edu.mit.BitBarLaunch.plist - A launchAgent to open BitBar on login.  
* Library: LaunchDaemons: edu.mit.updateToolKickerGUI.plist - A launchDaemon run the script to open the GUI program for the user when an update is detected and is NOT overdue.
* Library: LaunchDaemons: edu.mit.updateToolKickerOverDue.plist - A launchDaemon to run the script to scan for overdue updates and force an install if one is detected.
* Library: LaunchDaemons: edu.mit.updateToolInstaller.plist - Sets up a watched folder and processes any updates needing to be installed.
* usr: local: updateTool: updateKicker-popup.sh - This script will open the GUI update tool if an update is seen as being required on the computer.
* usr: local: updateTool: updateKicker-overdue.sh - This script will prompt/force the update if an update is past the due date and needs to be installed.
* usr: local: updateTool: updateInstaller.sh - Does the actual leg work of installing updates.  
* usr: local: updateTool: openPopUP.sh  - this script launches the GUI tool.  Used by BitBar menu bar so users can select that to open the GUI tool
* usr: local: updateTool: open BitBar.sh - because it crashes sometimes, this script will kill and relaunch bitbar.  
* usr: local: updateTool: Contents: Info.plist - contains version information allowing the tool itself to be updated by itself.
* usr: local: updateTool: updateToolTouchFiles - the watched directory. A file dropped in here will be processed by updateInstaller.sh to apply the update.
* usr: local: updateTool: Logos: logo.png - logo used by popups to show the user.
	
Scripts: postinstall - this script is used by build.sh to set the correct permissions on installed files.  

UpdateToolEA.sh - An extension attribute for Casper that shows if any of the updateTool files have been tampered with by comparing the MD5 value.  

LL App Update Tool - the source code for the GUI tool is in a different repository.  AppUpdatesGUI

_______________________________________________________
###BitBar:
This tool leverages BitBar.  BitBar is not required, but highly recommended.  You should have it installed and configured on workstations before installing the LLUpdateTool.  
http://getbitbar.com/   

If you do not have BitBar, the update tool will use Jamf's notify commands.

_______________________________________________________
###Configuring and Installing
1) Edit the DEVApplicationUpdateControl.plist.  Xcode is the best tool for this job.  Each application you want to update should have an entry and examples are included.  
	Source - String - JSS, Adobe, or Apple.  JSS will execute a JSS policy to apply the update.  Adobe will invoke Adobe's RUM to apply.  And Apple will invoke Apple's softwareupdate command.
	InstallPolicy - String - the name of the custom trigger to run to install the software. If JSS, then 'jamf policy -event <InstallPolicy>'.  
	LatestVersion - String - the expected version of the software.  If the version is older than this number, an upgrade will be triggered.  If later or equal number, no action will be taken.
	DueDate - Date - The date the update will be required to be installed.  
	Path - String - The path to the application.  This is how the script determines if the application is installed. 
	MinimumVersion - String - Optional parameter.  Any version below this version will be ignored.  An existing application below the minimum will NOT trigger an update. 

You can create multiple versions of that file - for Development, Staging, and Production.  

2) Edit the JssPolicy.sh file to add your JSS Server name to the top of the file on the configServer path.  The directory name is optional and allows you to keep the ApplicationUpdateControl.plist files in a directory.  

3) Test the JssPolicy by opening Terminal and typing, 'sudo' then drag the JssPolicy.sh file into Terminal so the full path is automatically entered.  Then type 'x y z DevApplicationUpdateControl.plist'.  Make sure there is a space between each of those items.  And if you changed the name of the config file, enter that instead.  Enter your password when prompted.  It should create a file at /usr/local/updateTool/updaterInfo.txt listing the applicable updates.  If not updates are available, no file will be created.  

4) Add JssPolicy.sh to your JSS Server and configure it to run on an appropriate schedule.  I use 2x a day (via two policies, thanks Jamf).  Parameter 4 should be the name of the config file you want run on the workstation.  You can scope different config files to different machines in order to test updates on groups of machines before full deployment.  

4) Build the package.  
Open Terminal and drag 'build.sh' into the terminal window.  That will create an installer for your client computers.  

5) As long as the JssPolicy.sh script is creating the /usr/local/updateTool/updaterInfo.txt file, the workstation will be able to receive new updates.  

