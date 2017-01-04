# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Lock Contents of the Dock

-- Version compatible: --
-- Preference Identifier: com.apple.dock
-- Preference Key: contents-immutable
-- Default value (boolean): 
-- Preference location: ~/Library/Preferences/com.apple.dock.plist

set toggleBut to "Enable Lock" as string
set tZ to "lock" as string
set sTz to "yes" as string
set bT to "You've decided to make the Dock locked so you can't edit its contents."
try
	set prValue to do shell script "defaults read com.apple.dock contents-immutable -boolean"
	if prValue = "1" then
		set prValue to "The Dock's contents is currently locked in place. You cannot rearrange items to the way you want." as string
		set toggleBut to "Unlock Dock" as string
		set tZ to "unlock" as string
		set sTz to "no" as string
		set bT to "You decided to unlock the Dock's contents."
	else
		set prValue to "The Dock's contents isn't locked, you can make changes to the contents of the Dock." as string
	end if
on error
	set prValue to "Unknown setting. The Dock lets you modify it with your customized items by default." as string
	toggleBut & tZ & sTz
end try
display alert "Would you like to " & tZ & " the Dock?" buttons {"Cancel", toggleBut, "Clear"} message "If locked, the current user's Dock will unable to be changed. All items will become locked in place." & return & return & prValue default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.dock contents-immutable -bool " & sTz
else
	do shell script "defaults delete com.apple.dock contents-immutable"
	set bT to "You've decided to clear the lock preference."
end if
tell application "System Events"
	display alert "Dock - Changes Applied!" message bT & " In order to see your changes the Dock will need to be restarted. Would you like to do that now?" buttons {"Don't restart", "Restart Dock"} cancel button 1 default button 2
	do shell script "killall Dock"
end tell