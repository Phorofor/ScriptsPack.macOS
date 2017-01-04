# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Show Quit Menu in Finder

-- Preference Identifier: com.apple.Finder
-- Preference location: ~/Library/Preferences/com.apple.finder.plist
-- Preference Key: QuitMenuItem
-- Default value (integer): 0

set toggleBut to "Enable 'Quit Finder'"
set tZ to "add"
set sTz to "1"
set bT to "You decided to enable the 'Quit Finder' menu item"

try
	set prValue to do shell script "defaults read com.apple.Finder QuitMenuItem"
	if prValue = "1" then
		set prValue to "The 'Quit Finder' item in the Finder drop down menu is enabled. Finder will quit like a regular application."
		set toggleBut to "Disable 'Quit Finder'"
		set tZ to "remove"
		set sTz to "0"
		set bT to "You decided to disable the 'Quit Finder' menu item"
	else
		set prValue to "The 'Quit Finder' item in the Finder drop down menu is hidden. You cannot quit the Finder like a regular application at this time."
	end if
on error
	set prValue to "The current setting isn't defined. The 'Quit Finder' menu item is hidden by default."
end try

display alert "Would you like to " & tZ & " the ability to quit Finder?" message "If the quit menu item is added, you will be able to use Cmd+Q and be able to quit it from the Finder dropdown menu just like a regular application." & return & return & prValue buttons ["Cancel", "Clear", toggleBut] default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.Finder QuitMenuItem " & sTz
else
	do shell script "defaults delete NSGlobalDOmain NSAutomaticWindowAnimationEnabled"
	set bT to "You've decided to clear the preference."
end if

tell application "System Events" to (name of every process)
if the result contains "Finder" then
	tell application "Finder"
		display alert "Restart Finder to see changes" message bT & ". In order to see the changes you've made, you need to restart Finder. Would you like to do that now?" buttons {"Restart Later", "Restart Finder"} default button 2 cancel button 1
		do shell script "killall Finder"
	end tell
	
else
	display alert "Finder - Changes Applied" message bT & ". The next time you open Finder you'll be able to see the changes."
end if
end