# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

(* Used for force ejecting the CD drive even if the CD doesn't appear in the Finder or is having problems mounting. Works whether there isn't a CD inserted into the CD drive of the computer. *)

-- No settings are changed when running this script

(* tell application "Finder"
	set defaultHD to (get name of startup disk) as string
end tell
set odsIcon to defaultHD & ":" *)
display alert "Force Eject CD Drive?" message "Check that a CD isn't burning or being written. This forces the CD Drive to eject after clicking 'Eject CD Drive'" buttons {"Cancel", "Eject CD Drive"} default button 2 cancel button 1

display dialog "Are you sure you want to force eject the CD drive now?" buttons {"Cancel", "Eject"} default button 1 cancel button 1 with title "Confirm Action - Eject Drive" with icon stop
-- Force eject CD drive
try
	do shell script "drutil eject"
on error
	display alert "An Expected Error Occured: Drive Eject Failed" message "The task did not complete successfully. Was there a a disc drive attached to the computer drive you wanted to eject? Or is an extension in the system to let the drive run was disabled?"
end try
display alert "The task was completed successfully." message "If the disc did not eject, there may be a problem with your CD drive, or there was no disc drive enabled or detected by the system."
end