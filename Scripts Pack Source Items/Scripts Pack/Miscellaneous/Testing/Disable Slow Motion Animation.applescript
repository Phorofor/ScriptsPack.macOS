# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Disables the slow motion animation when holding the Shift key. 

-- Disable Slow Motion Animation when holding Shift
-- Preference Identifier: com.apple.finder
-- Preference Key: FXEnableSlowAnimation
-- Preference location: ~/Library/Preferences/com.apple.finder.plist
-- Default value (bool): false

display alert "Would you like to enable or disable the slow motion animation?" message "Disables slow motion animation for the current user when holding shift and clicking something that does an animation. (e.g holding shift when minimizing a window.)" buttons {"Cancel", "Enable", "Disable"} default button 2 cancel button 1
if the button returned of the result is "Disable" then
	-- Disable slow motion animation
	do shell script "defaults write com.apple.finder FXEnableSlowAnimation -bool false"
else
	-- Enable slow motion animation (default setting)
	do shell script "defaults write com.apple.finder FXEnableSlowAnimation -bool true"
end if
display alert "Your changes have been applied but have not taken effect. You need to restart the Dock in order for changes to take effect, restart now?" message "You can restart the Dock later if you wish to." buttons {"Restart Later", "Restart Dock"} cancel button 1 default button 2
do shell script "killall Dock"
delay 2
tell application "Finder" to display alert "The Dock has been restarted! Your changes should have taken effect!"