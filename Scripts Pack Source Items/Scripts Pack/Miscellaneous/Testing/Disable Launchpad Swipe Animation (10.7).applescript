# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Disable the Launchpad (Springboard) Swipe Animation in Lion

-- Versions compatible: --
-- Preference Identifier: com.apple.dock
-- Preference Key: springboard-page-duration
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (integer): -- 

display alert "Would you like to enable or disable the Launchpad swipe animation?" buttons {"Cancel", "Enable", "Disable"} cancel button 1 default button 2 message "Takes effect for the current user, you can enable or disable the animation if you wish to."

if the button returned of the result is 3 then
	-- Disable swipe animation
	do shell script "defaults write com.apple.dock springboard-page-duration -int 0"
else
	-- Enable swipe animation (default setting)
	do shell script "defaults delete com.apple.dock springboard-page-duration"
end if
tell application "Dock"
	display alert "The Dock has to be restarted in order for changes to take effect. Would you like to restart now?" buttons {"Yes", "Cancel"} default button 1 cancel button 2
	do shell script "killall Dock"
end tell
delay 2
tell application "Dock"
	display alert "The Dock has been restarted! Your changes should now been taken affect!"
end tell