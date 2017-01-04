# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Finder Animations

-- Preference Identifier: com.apple.Finder
-- Preference Keys: DisableAllAnimations
-- Preference location: ~/Library/Preferences/com.apple.finder.plist
-- Default value (string): NO

set toggleBut to "Disable Animations"
set sTz to "YES"
set tZ to "disable"
set bT to "You've decided to disable the Finder's animations."

try
	set prValue to do shell script "defaults read com.apple.finder DisableAllAnimations"
	if prValue = "YES" then
		set prValue to "The Finder animations is enabled."
		set toggleBut to "Enable Animations"
		set tZ to "enable"
		set sTz to "NO"
		set bT to "You've decided to enable the Finder's animations."
	else
		set prValue to "The Finder animations is enabled."
	end if
on error
	set prValue to "The Finder animations are enabled by default."
end try

display alert "Would you like to " & tZ & " the Finder's animations?" message "Disabling the animations for Finder is helpful for slower computers. It will disable most of the animations for Finder. Animations such as the snap to grid one, will not disable it." & return & return & prValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.finder DisableAllAnimations -bool " & sTz
else
	do shell script "defaults delete com.apple.finder DisableAllAnimations"
end if
tell application "System Events" to (name of every process)
if the result contains "Finder" then
	tell application "Finder"
		display alert "Finder - Restart to see changes" message bT & " In order to see your changes, the Finder needs to be restarted. Would you like to do that now?" buttons ["Restart Later", "Restart Finder"] cancel button 1
	end tell
	do shell script "killall Finder"
else
	display alert "Finder - Your changes have been saved" message bT & " The next time you open Finder, you'll be able to see the changes you've made." buttons ["Cancel", "Open Finder"] cancel button 1 default button 2
	tell application "Finder" to run
end if