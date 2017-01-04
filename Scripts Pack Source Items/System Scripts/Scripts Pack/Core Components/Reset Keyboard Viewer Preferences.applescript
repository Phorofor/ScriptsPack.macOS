# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>


-- Resets keyboard viewer preferences for the current user account when the script is run as it may sometimes become a bugged window size.

-- Reset Keyboard Viewer Preferences
-- Versions compatible: 
-- Service: Keyboard Viewer
-- Preference Identifier: com.apple.KeyboardViewer
-- Preference Key: --
-- Preference location: ~/Library/Preferences/com.apple.KeyboardViewer.plist
-- Default value:  --

set useR to do shell script ("whoami")
try
	set prValue to do shell script "defaults read com.apple.KeyboardViewer"
	set psValue to return & return & "Keyboard Viewer preferences is currently available. You can reset it if you're having problems with the Keyboard Viewer."
	set thebt to "Ready to Reset"
	set theDef to "default button 2" as string
on error
	set psValue to return & return & "[Defaults]: Keyboard Viewer preferences is unavailable. Attempting to reset the preference will fail." as string
	set thebt to "No Preference Found"
end try
display alert "Reset Keyboard Viewer preferences?" message "This script is useful incase the Keyboard Viewer doesn't display properly. (such as displaying a tiny pixel window when using the Keyboard Viewer)" & psValue buttons {"Cancel", thebt, "Reset"} default button 3 cancel button 1
if the button returned of the result is "Reset" then
	-- Reset the preferences
	try
		do shell script "defaults delete com.apple.KeyboardViewer"
		display alert "The current user (" & useR & ") Keyboard Viewer preferences have been removed. Open the Keyboard Viewer to create the default preferences for it."
	on error
		display alert "An Expected Error Occured: File Not Available" as warning message "The Keyboard Preferences (com.apple.KeyboardViewer) file is not available for the user " & useR & ". " & "The preference might not have been created or has been removed. Open the Keyboard Viewer to generate its default preferences. Check its permissions if the file already exists."
	end try
end if