QuickStart Guide - to deploy the App Update tool quickly.  

You will need the following:
1) Access to a JAMF JSS server
2) Access to a web server where you can post a file
3) A client computer to update
4) An installer for a program you want to update (ie: Firefox)

Let's Go!
1) Click on the gear on the top right of your JSS and select Scripts.  Create a new script in your JSS  - call it Scan For Updates.   Copy the contents of the ScanForUpdates.sh script into the JSS Script.  

2) Create a policy to run the script.  
	In parameter 4, set it to the path to a webserver where you'll put the config file (ie: http://mycompany.com/configFiles). Your client computers will download a file on this server to know what updates are appropriate for them.  
	In parameter 5, enter the file name that contains the updates.  In this tutorial, it is called DEVApplicationUpdateControl.plist
	The Custom policy needs to be 'updateapps4'.  Set it to run Ongoing with no other triggers and scoped to all computers.
	
	![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/ScanPolicyParameters.png)
	![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/ScanCustomTrigger.png)

3) Duplicate the policy from above.  Remove the custom trigger and add a 'Check-in' trigger.  Set the frequency to every hour or every day.  This policy ensures machines are scanned for updates occasionally.  The above policy in step 2 is used to refresh updates when called by the client. 

	![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/ScanCheckIn.png)

4) Create a policy in your JSS for each applicaiton you want to update.  Firefox for example, create a policy to install firefox, scoped to all computers.  The trigger should be a custom trigger with a name such as 'firefox520'.  If you want, you may publish to Self Service but do not have any other triggers on it.  Set it be available 'ongoing'.

	![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/FirefoxPolicy.png)

5) Edit the file DEVApplicationUpdateControl.plist to list applications which need updates.  XCode is best for this task.  Delete the other lines in that file except for Firefox.  Set the InstallPolicy to be the name of the policy from step 2 (ie: firefox520).  Set the DueDate to a day or two after today.  Set the LatestVersion in the file to match the version of Firefox you are deploying.

	![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/DEVControlplist.png)

6) Copy the file DEVApplicationUpdateControl.plist to the web server you specified in step 2.  You may need to edit your webserver MIME types to support the file extension of .plist.

7) Install the UpdateTool.pkg to your client machine.  (https://github.com/tmhoule/AppUpdates/raw/master/UpdateTool.pkg)

8) When the ScanForUpdates policy/script runs, the computer will record all updates needed by the computer.  It'll go through managed apps, such as Firefox deployed above.  It'll also look at AppleSoftwareUpdate for Apple updates and RemoteUpdateManager for Adobe Creative Cloud updates.  

9) To see what updates are needed by a computer, open /Applications/Utilities/App Update Tool.   That'll list what the computer needs along with the due date.  You can check the boxes to install the wanted updates there.

	![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/AppGUIimage.png)
	
10) Overdue updates will show on the machine like this

	![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/overdueUpdate.png)

11) If you [have BitBar installed](https://github.com/tmhoule/AppUpdates/wiki/BitBar-Integration), then updates will also show in the menu bar.

        ![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/MenuBar.png)

To deploy more updates, you can create another policy besides Firefox (and edit the DEVApplicationUpdateControl.plst to list it).  You can also create different files - a ProductionApplicationUpdateControl.plist that runs on your production machines, while the DEV one runs only on your test machines!  More info to come in the Wiki/ReadMe

