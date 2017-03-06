QuickStart Guide - to deploy the Mac Update tool quickly.  

1) Edit the file ScanForUpdates.sh.  Line 17 is called 'ConfigServer'.  Set it to the path to a webserver where you'll put the config file. Your client computers will download a file on this server to know what updates are appropriate for them.

2) Create a policy in your JSS for each applicaiton you want to update.  Firefox for example, create a policy to install firefox.  Scoped to all computers.  The trigger should be a custom trigger with a name such as 'firefox54'.  Do not publish to Self Service and do not have any other triggers on it.

3) Edit the file DEVApplicationUpdateControl.plist to list applications which need updates.  XCode is best for this task.  Delete the other lines in that file except for Firefox.  Set the InstallPolicy to be the name of the policy from step 2 (ie: firefox54).  Set the DueDate to a day or two after today.  

4) Copy the file DEVApplicationUpdateControl.plist to the web server you specified in step 1.  You may need to edit your webserver MIME types to support the file extension of .plist.

5) Click on the gear on the top right of your JSS and select Scripts.  Create a new script in your JSS  - call it Scan For Updates.   copy the contents of the ScanForUpdates.sh script into the JSS Script.

6) Install the LLUpdateTool.pkg to your client machine.  

7) Create a new policy in your JSS, scoped to your test machine (or all machines if you're ready to deploy!). Add to it the script created in step 5.  For the parameter "Parameter 4" enter the name of the file from step 3.  Also, create a Custom Trigger should be 'updateapps4'.  Set the Execution Frequency to Ongoing.  Also check the box for Self Service for this policy - you can deploy on a schedule of your choice later.  

8) When the ScanForUpdates policy/script runs, the computer will record all updates needed by the computer.  It'll go through managed apps, such as Firefox deployed above.  It'll also look at AppleSoftwareUpdate for Apple updates and RemoteUpdateManager for Adobe Creative Cloud updates.  

9) To see what updates are needed by a computer, open /Applications/Utilities/App Update Tool.   That'll list what the computer needs along with the due date.  You can check the boxes to install the wanted updates there.

To deploy more updates, you can create another policy (and edit the DEVApplicationUpdateControl.plst to list it).  You can also create different files - a ProductionApplicationUpdateControl.plist that runs on your production machines, while the DEV one runs only on your test machines!  More info to come in the Wiki/ReadMe
