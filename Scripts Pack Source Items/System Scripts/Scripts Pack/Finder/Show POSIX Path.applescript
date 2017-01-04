# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Will show path of folder on the title bar instead the name of the folder (POISX Path)

-- Show POSIX Path for Finder

-- Versions compatible: --
-- Preference Identifier: com.apple.finder
-- Preference Key: _FXShowPosixPathInTitle
-- Preference location: ~/Library/Preferences/com.apple.finder.plist
-- Default value (boolean): NO

set vC to "com.apple.finder _FXShowPosixPathInTitle"
set toggleBut to "Show"
set tZ to "show the full path "
set sTz to "TRUE"
set bT to "You've decided to show only the current folders name in the windows of the Finder title bars."

try
	set prValue to do shell script "defaults read " & vC
	if prValue = "1" then
		set psValue to "The Finder will show the full POISX path in the title bar."
		set toggleBut to "Hide"
		set tZ to "not show the full path"
		set sTz to "FALSE"
		set bT to "You've decided to show the full path in Finder's title bar."
	else
		set psValue to "The Finder will only show the current folder name in its title bar."
	end if
on error
	set psValue to "The full path of folders are not shown by default."
end try

display alert "Would you like Finder to " & tZ & " of a folder in the title bar of windows instead of just the folder name?" message "Instead of showing the name of a folder in the Finder's title bar, it will show the full path so you can enter the path manually (e.g. the Macintosh HD will be display as  ''/'' when the POISX Path is shown.)" & return & return & psValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
set the button_pressed to the button returned of the result

-- Don't show Finder path in title bar (default setting)
if the button_pressed is toggleBut then
	do shell script "defaults write " & vC & " -bool " & sTz
else
	-- Show Finder path in title bar
	do shell script "defaults delete " & vC
end if
tell application "System Events" to (name of every process)
if the result contains "Finder" then
	tell application "Finder"
		display alert "Finder - Restart to see changes" message bT & " Your changes will take effect when you restart Finder. Would you like to do that now?" buttons ["Restart Later", "Restart Finder"] cancel button 1 default button 2
		do shell script "killall Finder"
	end tell
else
	display alert "Finder - Changes Applied" message bT & ". The next time you open Finder you'll be able to see the changes."
end if