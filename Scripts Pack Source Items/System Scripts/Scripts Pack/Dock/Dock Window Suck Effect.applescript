# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Change to the hidden 'Suck' effect for the Dock
-- Versions compatible: 
-- Preference Identifier: com.apple.dock
-- Preference Key: mineffect
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (string): genie 

tell application "Finder"
	set defaultHD to (get name of startup disk) as string
end tell

set pIcon to defaultHD & ":System:Library:CoreServices:Dock.app:Contents:Resources:Dock.icns"

display alert "Set Dock Minimize Animation." message "Would you like to set the Dock animation when minimizing windows to the Dock? You are able to use the hidden 'Suck' effect that doesn't appear in the Dock preferences." buttons ["Cancel", "Set Animation"] cancel button 1

set tValue to "defaults write com.apple.dock mineffect -string " as string
set pValue to (choose from list ["Suck", "Genie", "Scale"] with prompt "Which effect would you like to use when minimizing windows to the Dock?" with title "Dock - Minimize Effect") as string
if pValue is equal to "false" then
	display alert "Dock - Action Canceled" message "No changes were made to the Dock minimize effect." buttons ["OK"] cancel button 1
end if
if pValue is equal to ["Suck"] then
	do shell script tValue & pValue
end if
if pValue is equal to ["Genie"] then
	do shell script tValue & pValue
else
	do shell script tValue & pValue
	
	display dialog "You've set the effect to: " & pValue & return & "Restart the Dock to see changes?" buttons ["Don't restart", "Restart Dock now"] cancel button 1 default button 2 with title "Dock - Changes Applied" with icon file pIcon
	do shell script "killall Dock"
end if