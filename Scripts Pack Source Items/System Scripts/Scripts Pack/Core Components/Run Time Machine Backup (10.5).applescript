# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

set MacVer to do shell script "sw_vers -productVersion"

-- Start Time Machine Backup...
-- You can also use this as a reminder in iCal.

-- Notes:
-- This script doesn't 'end' after completing the backup.

-- Versions compatible: 10.5 Leopard and later

set TMPref to "open /System/Library/PreferencePanes/TimeMachine.prefPane"
set defaultHD to (get path to applications folder) as string
set mcIcon to defaultHD & "Time Machine.app:Contents:Resources:backup.icns"

display dialog "Would you like to run a backup?" & return & return & "Time Machine needs to be set up in order to backup. Make sure your backup disk is mounted then click 'Run Time Machine Backup' when ready. While Time Machine is backing up data, you should NOT unplug the backup drive while backuping up is in progress or the disk may corrupt. Stop the backup first then unplug the drive. You can do this through using the menubar icon or Time Machine Preferences." with icon file mcIcon with title "Time Machine - Backup" buttons ["Exit", "Time Machine Preferences…", "Run Time Machine Backup"] default button 3 cancel button 1

if the button returned of the result is "Time Machine Preferences..." then
	do shell script TMPref
else
	try
		do shell script TMPref
		do shell script "/System/Library/CoreServices/backupd.bundle/Contents/Resources/backupd-helper &"
	on error
		display alert "An Expected Error Occured! - Backup Failed!" as warning message "Your backup disk may not be mounted or Time Machine is not setup, click 'Time Machine Preferences…' to activate Time Machine so you can backup your files." buttons ["Open Time Machine Preferences…", "OK"] cancel button 2 default button 2
		do shell script TMPref
	end try
end if