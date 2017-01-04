# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Change the screencapture format when using the shortcuts to taking screenshots

-- Screencapture format

-- Versions compatible: 
-- Preference Identifier: com.apple.screencapture
-- Preference Key: type
-- Preference location: ~/Library/Preferences/com.apple.screencapture.plist
-- Default value (string): png

set defaultHD to (path to system folder) as string
set pIcon to defaultHD & "Library:CoreServices:Dock.app:Contents:Resources:Dock.icns"

display alert "Set Screenshot Format" message "Sets the screencapture format to the desired one, instead of the default PNG format. SystemUIServer will be restarted after choosing an action in the next prompt. Choose 'Restore' to clear the setting and return to its defaults." buttons ["Cancel", "Restore", "Set Screencapture Format"] cancel button 1

if the button returned of the result is "Restore" then
	display dialog "Screencapture image format settings will be restored. Click 'OK' to continue this action." with title "Screencapture - Clear Image Format" with icon file pIcon buttons ["Exit", "OK"] cancel button 1 default button 2
	do shell script "defaults delete com.apple.screencapture type; killall SystemUIServer"
else
	set tValue to "defaults write com.apple.screencapture type " as string
	set pValue to (choose from list ["png", "tiff", "pdf", "gif", "jpg", "jpeg", "psd"] with prompt "Choose a image format to set for the screencaptures." with title "Screencapture - Change Image Format") as string
	set DeF to do shell script tValue & pValue as string
	if pValue is equal to "false" then
		display alert "Screencapture - Image Format" message "No changes were made for the screencapture image format." buttons ["OK"] cancel button 1
	end if
	if pValue is equal to pValue then
		DeF
	else
		DeF
	end if
	do shell script "killall SystemUIServer"
	display alert "Screencapture - Changes Applied!" message "You've set the screencapture format to be: " & pValue & ". You should be able to see your changes." buttons ["OK"]
end if