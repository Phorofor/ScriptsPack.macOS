# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Always allow emptying of the Trash regardless if it has files or not.
-- Trash Always Full

-- Version compatible: --
-- Preference Identifier: com.apple.dock
-- Preference Key: no-glass 
-- Default value (boolean): NO
-- Preference location: ~/Library/Preferences/com.apple.dock.plist

set toggleBut to "Always Show as Full"
set tZ to "always show the Trash as full?"
set sTz to "YES"
set bT to "You've decided to use the full trash behaviour."
try
	set prValue to do shell script "defaults read com.apple.dock trash-full"
	if prValue = "1" then
		set prValue to "The Trash is set to behave as if it was full."
		set toggleBut to "Use Default Behaviour"
		set tZ to "use the default behaviour of the Trash?"
		set sTz to "NO"
		set bT to "You decided to switch to the 3D Glass Dock."
	else
		set prValue to "The Trash behaviour is set to be always full."
	end if
on error
	set prValue to "The trash uses its default behaviour by default."
end try
display alert "Would you like to " & tZ message "If it is shown as full, the Trash behaves as if it was full so it will always show the full trash icon and will allow you to empty it even while it's empty." & return & return & prValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.dock trash-full -bool " & sTz
else
	do shell script "defaults delete com.apple.dock trash-full"
	set bT to "You've decided to clear the preference."
end if
tell application "System Events" to (name of every process)
if the result contains "Dock" then
	tell application "System Events"
		display alert "Dock - Restart to see changes." message bT & " The Dock needs to be restarted in order to apply your changes. Would you like to restart the Dock now?" buttons {"Don't Restart", "Restart Dock"} cancel button 1 default button 2
		do shell script "killall Dock"
	end tell
else
	display dialog bT & " You'll be able to see the changes the next time the Dock is running"
end if