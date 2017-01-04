# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Dimmed Hidden Applications

-- Version compatible: --
-- Preference Identifier: com.apple.dock
-- Preference Key: showhidden
-- Default value (boolean): 
-- Preference location: ~/Library/Preferences/com.apple.dock.plist

set toggleBut to "Show Hidden Application Dim"
set tZ to "show hidden applications with a dimmed icon?"
set sTz to "yes"
set bT to "You've decided to show hidden applications as a dimmed icon."
try
	set prValue to do shell script "defaults read com.apple.dock showhidden -boolean"
	if prValue = "1" then
		set prValue to "Hidden applications will be dimmed when being hidden."
		set toggleBut to "Remove Dimmed Applications"
		set tZ to "remove the dimmed effect from hidden applications?"
		set sTz to "no"
		set bT to "You decided to unlock the Dock's contents."
	else
		set prValue to "Hidden applications will not appear with a dimmed icon."
	end if
on error
	set prValue to "Applications that are hidden isn't shown as a dimmed icon by default."
	toggleBut & tZ & sTz
end try
display alert "Would you like to " & tZ buttons {"Cancel",  toggleBut} message "If the hidden application dimming is enabled, hidden applications will show as a slightly dimmed icon on the dock instead of the basic style." & return & return & prValue default button toggleBut cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.dock showhidden -bool " & sTz
else
	do shell script "defaults delete com.apple.dock showhidden"
	set bT to "You've decided to clear the hidden application dim preference."
end if
tell application "System Events"
	display alert "Dock - Changes Applied!" message bT & " In order to see your changes the Dock will need to be restarted. Would you like to do that now?" buttons {"Don't restart", "Restart Dock"} cancel button 1 default button 2
	do shell script "killall Dock"
end tell