# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

# When Xray folders is used, using QuickLook in Finder will show a transparent folder icon with the icons of documents cycling.  Does not work in OS X Lion (10.7)+ *)

-- Xray Folders for QuickLook
-- Versions compatible: Leopard (10.5) - Snow Leopard (10.6.*)
-- Preference: com.apple.finder
-- Preference Key: QLEnableXRayFolders
-- Preference location: ~/Library/Preferences/com.apple.finder
-- Default value (integer): 0

(*
set MacVer to do shell script "sw_vers -productVersion"
set Max to "10.6.8" as string
set Min to "10.5.0" as string

if MacVer > Max then
	display alert "Feature No Longer Supported for " & MacVer & "!" message "Sorry, your current version of macOS will have no effect with this script. It will only work with Leopard (10.5) up to Snow Leopard (10.6.*). This feature is no longer supported." buttons ["OK"] as warning cancel button 1
end if
if MacVer < Min then
	display alert "Outdated macOS Version!" message "You're using macOS " & MacVer & " which means this script will only work properly with macOS " & Min & " up to " & Max & ". This feature is not available at this time." buttons ["OK", "Ignore"] as warning cancel button ["OK"]
else
*)
set toggleBut to "Enable Xray"
set tZ to "show"
set sTz to "1"
set bT to "You've decided to enable Xray folders"
try
	set prValue to do shell script "defaults read com.apple.finder QLEnableXRayFolders"
	if prValue = "1" then
		set prValue to "Xray folders is enabled."
		set toggleBut to "Disable Xray"
		set tZ to "hide"
		set sTz to "0"
		set bT to "You've decided to disable Xray folders."
	else
		set prValue to "Xray folders is disabled."
	end if
on error
	set prValue to "The current setting is unknown. QuickLook Xray Folders are disabled by default."
end try
display alert "Use Xray folders in QuickLook?" message "When Xray folders are shown, any folder viewed with QuickLook will show a transparent folder icon with the contents inside cycling." & return & return & prValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.finder QLEnableXRayFolders " & sTz
else
	do shell script "defaults delete com.apple.finder QLEnableXRayFolders"
	set bT to "You've decided to clear the preference."
end if
tell application "System Events" to (name of every process)
if the result contains "Finder" then
	tell application "Finder"
		display alert "Restart needed for changes to take effect" message bT & " You'll need to restart the Finder in order to see your changes. Would you like to restart the Finder now?" buttons ["Don't Restart Finder", "Restart Finder"] cancel button 1 default button 2
	end tell
	do shell script "killall Finder"
else
	display alert "Finder - Your changes have been saved" message bT & " The next time you open Finder, you'll be able to see the changes you've made." buttons ["Cancel", "Open Finder"] cancel button 1 default button 2
	tell application "Finder" to run
end if
# end if
end