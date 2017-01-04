# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Shows all files in Finder for the current user including hidden ones if hidden files are shown (e.g. files with a period ( . ) in front of their name, which are hidden by default.)

-- Show Hidden Files for Finder

-- Versions compatible: 
-- Preference Identifier: com.apple.finder
-- Preference Key: AppleShowAllFiles
-- Preference location: ~/Library/Preferences/com.apple.finder.plist
-- Default value (string): false

try
	set tZ to "Show"
	set sTz to "TRUE"
	set bT to "You've decided to show the hidden files."
	
	set prValue to do shell script "defaults read com.apple.finder AppleShowAllFiles"
	if prValue = "true" then
		set prValue to "The Finder has hidden files shown. Hidden files appear as a transparent icon than a normal file that isn't hidden. You can also name files starting with a period ( . ) at the front to make a file or folder hidden."
		set tZ to "Hide"
		set sTz to "FALSE"
		set bT to "You've decided to show the hidden files."
	else
		set prValue to "The hidden files are not shown in Finder. You won't be able to name files starting with a period ( . ) to make a file or folder hidden."
	end if
on error
	set prValue to "The hidden files in Finder aren't shown by default."
end try

display alert "Would you like the Finder to show/hide hidden files while browsing?" message "Shows all files in Finder for the current account that is being used. Hidden files will show as its normal icon which is dimmed, that means it's a hidden file or folder." & return & return & prValue buttons {"Cancel", "Clear", tZ} default button 3 cancel button 1
if the button returned of the result is tZ then
	do shell script "defaults write com.apple.finder AppleShowAllFiles " & sTz
else
	do shell script "defaults delete com.apple.finder AppleShowAllFiles"
end if

tell application "System Events" to (name of every process)
if the result contains "Finder" then
	tell application "Finder"
		display alert "Restart Finder to see changes" message bT & ". In order to see the changes you've made, you need to restart Finder. Would you like to do that now?" buttons {"Restart Later", "Restart Finder"} default button 2 cancel button 1
	end tell
	do shell script "killall Finder"
else
	display alert "Finder - Changes Applied!" message "The changes you've made have been applied. You'll be able to see your changes the next time you open Finder."
	(* delay 2.5
 tell application "Finder"
	display alert "The Finder has been restarted! Your changes have taken effect. You can change your setting if you aren't satisfied."
end tell *)
end if