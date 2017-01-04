# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Changes the list view style in the stacks to grid view like style when opened from a stack. 
-- List View Like Grid View for the Dock

-- Versions compatible: 
-- Preference Identifier: com.apple.dock
-- Preference Key: use-new-list-stack
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (boolean): YES

set toggleBut to "Use Grid View List Style" as string
set tZ to "grid view style for the list stacks?" as string
set sTz to "yes" as string
set bT to "You've decided to switch to the grid style view for the list stacks."
try
	set prValue to do shell script "defaults read com.apple.dock use-new-list-stack -bool"
	if prValue = "1" then
		set psValue to "List grid view style stacks is enabled. The icons are larger and acts like grid view." as string
		set toggleBut to "Use Classic View List Style" as string
		set tZ to "classic grid view style stacks?" as string
		set sTz to "no" as string
		set bT to "You've decided to switch to the classic grid view style for the list view stacks."
	else
		set psValue to "The list stack grid view style isn't enabled. You're using the classic list view style." as string
	end if
on error
	set psValue to "The classic list view style is always enabled by default." as string
end try
display alert "Would you like the list view in stacks to appear like the " & tZ message "When grid view style is set, it uses a list view like grid view's style, the icons are larger if the setting is chosen." & return & return & psValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.dock use-new-list-stack -bool " & sTz
else
	do shell script "defaults delete com.apple.dock use-new-list-stack"
	set bT to "You've decided to clear the preference."
	
end if
tell application "System Events" to (name of every process)
if the result contains "Dock" then
	tell application "System Events"
		display alert "Dock - Restart to see changes" message bT & " The Dock needs to be restarted before the changes can take effect. Click 'OK' to restart the Dock. The Dashboard will close when Dock is restarted, go to the Dashboard after the Dock is restarted to reload it again. All active application windows will pop open." buttons {"Cancel", "OK"} cancel button 1 default button 2
	end tell
end if
do shell script "killall Dock"