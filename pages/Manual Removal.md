# Manual Removal

**NOTE:** This only applies to people who have used the script to install but are having problems with uninstalling using the script provided in the AppleScript based installer. 

If you've installed manually by using the 'drag 'n' drop' folder method, you just need to delete that folder in the location you placed it.

If you've installed the Scripts Pack using the Installer provided and are getting 'an expected error' while attempting to uninstall, here's one of the ways to remove it manually which should be able to work:

**1.** Start pressing/holding the keys 'Command-Shift-G' at the same time while Finder is active, a dialog box should appear. Paste/Enter this location into the field:

``~/Library/Scripts``

**2.** Drag the 'Scripts Pack' folder to the Trash & empty the trash. (if you have any scripts in that folder you use personally use or want to keep that current version of the Scripts Pack, you may wish to place that folder somewhere else. You can rename it if you wish to.)

**3.** You've uninstalled the Scripts Pack successfully! If you wanted to update or reinstall the Scripts Pack, then you can do that now.

If you've followed the simple steps above it should've worked. If not you may wish to explore an alternative way that's right for you.

## Optional: Removing Preferences & Services

Scripts Pack may create preferences which is used by certain scripts so it can remember the last remembered file and so forth. These files may take a minimal amount of space. If you wish to remove it navigate to the location:

You can paste this into the 'Go to Folder…' field for easy access using Command+Shift+G when the Finder is active:

``~/Library/Preferences``

**Now delete the files:**

com.Phorofor.ScriptsPack.plist.lockfile
com.Phorofor.ScriptsPack.plist

Then empty the Trash. You will loose all your preferences for any script in the Scripts Pack. If none of those files exist you may not have used a script that saves custom objects for later use.

If you want to delete services from the Scripts Pack you don't want, navigate to:

``~/Library/Services``

You'll see all of the services that you have installed for your user account, delete the services you want to delete, if you remove a service they will also disappear from the Services preferences located in the Keyboard preferences.

You can manage your services and its hotkeys by navigating to:

Apple () > System Preferences… > Keyboard > Keyboard Shortcuts
then click Services on the list which should be towards the left.


## Terminal Method (Preferences Only)

If you've got access to a Terminal based application (an other alternative is that you can use X11's xTerm) you can enter this command:

defaults delete com.Phorofor.ScriptsPack

Check to make sure the command is correct, then press the return/enter key. The preferences for the Scripts Pack should now be deleted after following the steps correctly, you cannot get it back unless you've backed it up.

Apple's built-in Terminal application should be located in the folder:

``/Applications/Utilities/``

There should be an application called Terminal.app. Double-click that to open it, you can use any other Terminal emulator if you don't like Apple's built-in Terminal emulator.
