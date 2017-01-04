# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Dock change to 2D or 3D Snow Leopard, works with OS X Lion
-- Change Dock to 3D or 2D

-- Version compatible: Mac OS X Leopard (10.5)+
-- Preference Identifier: com.apple.dock
-- Preference Key: no-glass 
-- Default value (boolean): NO
-- Preference location: ~/Library/Preferences/com.apple.dock.plist

set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.5.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". This script will only work properly with Mac OS Leopard (10.5) and later. This feature is currently unavailable at this time because there is no 3D Dock that is native to your current version." buttons ["OK"] as warning cancel button 1
else

	set toggleBut to "Switch to 2D Dock"
	set tZ to "2D Black Dock"
	set sTz to "yes"
	set bT to "You've decided to switch to the 2D Black Dock."
	try
		set prValue to do shell script "defaults read com.apple.dock no-glass -boolean"
		if prValue = "1" then
			set prValue to "The 2D Dock is currently enabled."
			set toggleBut to "Switch to 3D Dock"
			set tZ to "3D glass Dock?"
			set sTz to "no"
			set bT to "You decided to switch to the 3D Glass Dock."
		else
			set prValue to "The 3D Dock is currently enabled."
		end if
	on error
		set prValue to "Undefined Setting. The 3D Dock is enabled bt default."
	end try
	display alert "Would you like to switch to the " & tZ message "When the 2D Dock is chosen it will switch to it, the Dock is similiar to OS X Tiger's Dock." & return & return & "Current setting: " & prValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
	if the button returned of the result is toggleBut then
		do shell script "defaults write com.apple.dock no-glass -boolean " & sTz
	else
		do shell script "defaults delete com.apple.dock no-glass"
		set bT to "You've decided to clear the preference."
	end if
	tell application "System Events" to (name of every process)
	if the result contains "Dock" then
		tell application "Dock"
			display alert bT & " The Dock needs to be restarted in order to apply your changes. Restart the Dock now?" buttons {"Don't restart", "Restart"} cancel button 1 default button 2
			do shell script "killall Dock"
			(* delay 3
			display alert "The Dock has been restarted. You should be able to see the changes you've made." *)
		end tell
	else
		display dialog bT & " You'll be able to see the changes the next time the Dock is running"
	end if
end if