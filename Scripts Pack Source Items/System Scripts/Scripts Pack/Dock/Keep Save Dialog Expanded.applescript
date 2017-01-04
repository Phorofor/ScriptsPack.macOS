# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Expand Sheet Dialog by default

-- Version compatible: Mac OS X Leopard (10.5)+
-- Preference Identifier: GlobalPreferences
-- Preference Key: NSNavPanelExpandedStateForSaveMode
-- Default value (boolean): NO
-- Preference location: ~/Library/Preferences/.GlobalPreferences.plist

set toggleBut to "Keep Save Dialog Expanded" as string
set tZ to "" as string
set sTz to "yes" as string
set bT to "You've decided to make the save dialog expanded."
try
	set prValue to do shell script "defaults read -g NSNavPanelExpandedStateForSaveMode
"
	if prValue = "1" then
		set prValue to "The save dialog will be expanded." as string
		set toggleBut to "Don't Keep Save Dialog Expanded" as string
		set tZ to "3D glass Dock?" as string
		set sTz to "no" as string
		set bT to "You decided to switch to the 3D Glass Dock."
	else
		set prValue to "Save dialog won't be expanded automatically." as string
	end if
on error
	set prValue to "Undefined Setting. The save dialog isn't expanded by default." as string
end try
display alert "Would you like to keep the save dialog expanded?" message "The dialog when you save a file will become expanded already for you when saving a file." & return & return & prValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write -g NSNavPanelExpandedStateForSaveMode -bool " & sTz
else
	do shell script "defaults delete -g NSNavPanelExpandedStateForSaveMode"
	set bT to "You've decided to clear the preference."
end if
display dialog bT & return & return & "You'll be able to see the changes in any application that is restarted or opened." buttons ["OK"] default button 1 with icon 1 with title "Changes Applied!"
end