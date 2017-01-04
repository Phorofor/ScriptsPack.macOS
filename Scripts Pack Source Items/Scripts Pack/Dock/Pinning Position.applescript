# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Changes the position where the dock is pinned instead of being in the middle
-- Dock Pinning Position

-- Versions compatible: Not 10.12
-- Preference Identifier: com.apple.dock
-- Preference Key: pinning
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (string): middle

set defaultHD to (path to system folder) as string

set pIcon to defaultHD & "Library:CoreServices:Dock.app:Contents:Resources:Dock.icns"

display alert "Set Dock Pinning Position" message "This will make the Dock become middle in either the start, middle or at the end. Instead of being in the middle which is the default setting." buttons ["Cancel", "Set Dock Pinning"] cancel button 1

set tValue to "defaults write com.apple.dock pinning -string " as string
set pValue to (choose from list ["Start", "Middle", "End"] with prompt "Which point do you want to pin the Dock to?") as string

if pValue is equal to "false" then
	display alert "Dock - Pinning" message "No changes were made to the Dock." buttons ["OK"] cancel button 1
end if
if pValue is equal to ["Start"] then
	do shell script tValue & pValue
end if
if pValue is equal to ["Middle"] then
	do shell script tValue & pValue
end if
if pValue is equal to ["End"] then
	do shell script tValue & pValue
else
	do shell script tValue & pValue
	
	tell application "System Events"
		display alert "Dock - Changes Applied!" message "You've set the Dock to be pinned at the: " & pValue & ". In order to see the changes you've made, you need to restart the Dock. Would you like to do that now?" buttons ["Don't Restart", "Restart Dock now"] cancel button 1 default button 2
		do shell script "killall Dock"
	end tell
end if