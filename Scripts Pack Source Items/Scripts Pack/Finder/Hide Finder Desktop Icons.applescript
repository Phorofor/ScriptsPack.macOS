# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Hides the icons on the Desktop while Finder is open. The desktop will be inactive when icons are hidden

-- Hide Desktop Icons for Finder
-- Versions compatible:
-- Preference Identifier: com.apple.finder
-- Preference Keys: CreateDesktop
-- Preference location: ~/Library/Preferences/com.apple.finder.plist
-- Default value (integer): 0

set tZ to "Hide"
set sTz to "NO"
set bT to "You've decided to hide the Finder's Desktop icons."

try
	set prValue to do shell script "defaults read com.apple.finder CreateDesktop"
	if prValue = "NO" then
		set prValue to "The Finder Desktop icons is currently hidden."
		set tZ to "Show"
		set sTz to "YES"
		set bT to "You decided to show the Finder Desktop icons."
	else
		set prValue to "The Finder Desktop icons is currently shown."
	end if
on error
	set prValue to "The Desktop icons are shown by default."
end try

display alert tZ & " Desktop Icons?" message "If icons are hidden, the desktop will be inactive making it not possible to drag files there. Your files that are on your desktop will still remain in your user Desktop folder." & return & return & prValue buttons {"Cancel", "Clear", tZ} default button 3 cancel button 1
if the button returned of the result is tZ then
	do shell script "defaults write com.apple.finder CreateDesktop " & sTz
else
	do shell script "defaults delete com.apple.finder CreateDesktop"
end if
-- Check for process is active and display message
tell application "System Events" to (name of every process)
if the result contains "Finder" then
	tell application "Finder"
		display alert "Restart needed for changes to take effect." message bT & " In order to see your changes, you'll need to restart the Finder. You can choose to restart it later." buttons ["Restart Later", "Restart Now"] cancel button 1 default button 2
		do shell script "killall Finder"
	end tell
else
	display alert bT & " You'll be able to see your changes the next time you run Finder."
end if