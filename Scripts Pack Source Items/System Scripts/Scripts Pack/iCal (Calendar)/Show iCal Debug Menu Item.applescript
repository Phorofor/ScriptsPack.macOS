# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Shows a debug menu when running iCal
-- Show Debug Menu in iCal

-- Versions compatible:
-- Preference Identifier: com.apple.iCal
-- Preference Key: IncludeDebugMenu
-- Preference location: ~/Library/Preferences/com.apple.iCal.plist
-- Default value (boolean): NO

set toggleBut to "Show Debug Menu"
set tZ to "show"
set sTz to "YES"
set bT to "You've decided that iCal should show the debug menu item"
try
	set prValue to do shell script "defaults read com.apple.iCal IncludeDebugMenu"
	if prValue = "-1" then
		set prValue to "The iCal debug menu is now shown." as string
		set toggleBut to "Hide Debug Menu"
		set tZ to "hide"
		set sTz to "NO"
		set bT to "You've decided to disable the screenshot shadows, you will no longer see them when you take screenshots."
	else
		set prValue to "The iCal debug menu item is hidden. You will not be able to access it when it's running." as string
	end if
on error
	set prValue to "The current setting is unknown. The iCal debug menu item is hidden by default." as string
end try
display alert "Would you like to " & tZ & " the iCal debug menu?" message "Shows a debug menu in the menubar when running iCal. It gives access to some features." & return & return & prValue buttons ["Cancel", "Clear", toggleBut] default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.iCal IncludeDebugMenu " & sTz
	
else
	do shell script "defaults delete com.apple.iCal IncludeDebugMenu"
	set bT to "You've decided to clear the preference."
end if
tell application "System Events" to (name of every process)
if the result contains "iCal" then
	ignoring application responses
		tell application "Calendar"
			display alert "Quit iCal to see changes" message bT & ". To see the changes you've made, you need quit iCal. Would you like to do that now? You'll have to open iCal manually." buttons {"Restart Later", "Quit iCal"} default button 2 cancel button 1
			tell application "Calendar" to quit
		end tell
	end ignoring
else
	display alert "iCal - Changes Applied!" message bT & ". Your changes will take effect the next time you open iCal." buttons ["Cancel", "Open iCal"] cancel button 1
	tell application "Calendar" to run
end if