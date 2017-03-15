#### NOTE: View the quickstart guide for a quick tutorial.  
##### (https://github.com/tmhoule/AppUpdates/blob/master/QUICKSTART.md)
___________________________
### About:
This suite of tools allows a Jamf JSS to manage application updates on workstations in your environment.  It can do version comparisons and force updates after a set period of time.

![alt tag](https://github.com/tmhoule/AppUpdates/raw/master/ReadMeImages/AppGUIimage.png)

Updates come from your JAMF JSS, Apple Software Update, and Adobe's Remote Update Manager.  While the later two are automatic, you provide updates and due dates for internal applications.  Simply create a policy for an application with a custom trigger and add an entry to the AppUpdates configration file. If the application is installed on a machine and it has an older version, the update will be offered until the due date.  After the due date, the user will get a warning/countdown and the application will be automatically updated.  

Additional information is available in the Wiki

#### Three components
There are three diffrent parts to this utility.  A suite of client bash scripts with a GUI tool to view updates, a script that runs on your JSS via a policy, and a configuration file on a webserver.  
