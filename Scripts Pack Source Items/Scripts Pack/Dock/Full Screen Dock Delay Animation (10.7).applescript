# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Full Screen Delay Dock Animation

-- Versions compatible: Mac OS X Lion (10.7)+
-- Preference Identifier: com.apple.dock
-- Preference Key: autohide-fullscreen-delayed
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (boolean): TRUE

set MacVer to do shell script "sw_vers -productVersion"
set MacVer to "10.7.0"
set Min to "10.7.0"
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". This script will only work properly with Mac OS Lion (10.7) and later. This script will not work as expected for your current version as it doesn't have full screen. Please update for in order for this feature to work!" buttons ["OK", "More Information"] as warning cancel button 1
	do shell script "open http://support.apple.com/kb/SP629"
else
	set toggleBut to "Enable"
	set tZ to "enable"
	set sTz to "FALSE"
	set bT to "You've disabled the full screen Dock delay animation."
	try
		set prValue to do shell script "defaults read com.apple.dock autohide-fullscreen-delayed"
		if prValue = "FALSE" then
			set psValue to "🔲 The full screen Dock delay animation is enabled."
			set toggleBut to "Disable"
			set tZ to "disable"
			set sTz to "TRUE"
			set bT to "You've enabled the full screen Dock delay animation."
		else
			set psValue to "🔴 The full screen Dock delay animation is currently disabled."
		end if
	on error
		set psValue to "🔲 The full screen delay animation is enabled by default."
	end try
	display alert "Would you like to " & tZ & " the full screen Dock delay animation?" message "If the Dock is set to become always shown, it will also animate when it's hiding or showing when entering full screen mode or closing it." & return & return & psValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
	if the button returned of the result is toggleBut then
		do shell script "defaults write com.apple.dock autohide-fullscreen-delayed " & sTz
	else
		do shell script "defaults delete com.apple.dock autohide-fullscreen-delayed"
	end if
	tell application "System Events" to (name of every process)
	if the result contains "Dock" then
		tell application "System Events"
			display alert "Dock - Restart to see changes." message bT & " The Dock needs to be restarted in order for your changes to take effect. Would you like to restart the Dock now?" buttons {"Don't Restart", "Restart Dock"} cancel button 1 default button 2
			do shell script "killall Dock"
		end tell
	else
		display dialog bT & " You'll be able to see the changes the next time the Dock is running"
	end if
end if