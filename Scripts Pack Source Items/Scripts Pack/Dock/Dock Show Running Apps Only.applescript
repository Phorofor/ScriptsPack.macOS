# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>


-- Show only running applications in the Dock, if used improperly your current settings will be overwritten.

-- Show Running Applications Only
-- Version compatible: --
-- Preference Identifier: com.apple.dock
-- Preference Key: static-only
-- Default value (boolean): NO
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
try
	set prValue to do shell script "defaults read com.apple.dock static-only -boolean"
	if prValue = "1" then
		set prValue to "[ ! WARNING ! ]: The Dock will only show running applications. Modifying it will cause the normal preferences to be overwritten, please don't drag anything in the Dock or you can lock the Dock so you cannot drag any files across." as string
	else
		set prValue to "The Dock is at its default setting." as string
	end if
on error
	set prValue to "Unknown setting. The Dock lets you modify it with your customized items by default." as string
end try
display alert "Would you like to use the 3D Glass Dock or the 2D Glass Dock?" message "When the 2D Dock is chosen it will switch to it, the Dock is similiar to OS X Tiger's Dock." & return & return & prValue buttons {"Cancel", "Show Only Running Applications", "Return to Default"} default button 3 cancel button 1
if the button returned of the result is "Show Only Running Applications" then
	do shell script "defaults write com.apple.dock static-only -boolean YES"
	display alert "Watch out when choosing this!" message "If this feature is enabled, this will only show applications that are running. Dragging an item on the Dock while this feature is enabled will mess up your setting for the Dock. Should you take the risk of losing your setting or proceed anyway?" buttons ["Flee to the Exit", "Proceed Anyway"] as warning cancel button 1 default button 1
	set bT to "You've decided to make the Dock to show only the currently running applications. This feature may mess up your 'default' Dock when modifying it with this setting enabled."
else
	do shell script "defaults write com.apple.dock static-only -boolean NO"
	set bT to "You've decided to return the normal setting for the Dock."
end if
(* tell application "System Events" to (name of every process)
if the result contains "Dock" then *)
tell application "System Events"
	display alert "Dock - Changes Applied!" message bT & " In order to see your changes the Dock will need to be restarted. Would you like to do that now?" buttons {"Don't restart", "Restart Dock"} cancel button 1 default button 2
	do shell script "killall Dock"
	(*	delay 3
	display alert "The Dock has been restarted. You should be able to see the changes you've made." *)
end tell
(* else
	display dialog "You'll be able to see the changes the next time the Dock is running"
end *)
end