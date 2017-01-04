# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Prevents the Dashboard from being able to run if disabled, Dashboard widgets take up RAM, this is useful for disabling it on computers with limited hardware

-- Disable Dashboard
-- Versions compatible: Tiger (10.4)+
-- Preference Identifier: com.apple.dashboard
-- Preference Key: mcx-disabled
-- Preference location: ~/Library/Preferences/com.apple.dashboard.plist
-- Default value (boolean): NO
 
(*
set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.4.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". This feature isn't available for your current version of Mac OS. Maybe it's time to upgrade?" buttons ["OK"] as warning cancel button 1
end if
*)
set toggleBut to "Disable"
set tZ to "disable"
set sTz to "YES"
set bT to "You've decided to disable the Dashboard."
try
	set prValue to do shell script "defaults read com.apple.dashboard mcx-disabled"
	
	if prValue = "1" then
		set psValue to "The Dashboard is disabled. You cannot access your Dashboard widgets or open the Dashboard."
		
		set toggleBut to "Enable"
		set tZ to "enable"
		set sTz to "NO"
		set bT to "You've decided to enable the Dashboard."
	else
		set psValue to "The Dashboard is enabled. You can disable it to save RAM."
	end if
on error
	set psValue to "The Dashboard is enabled by default."
end try

display alert "Would you like to disable or enable the Dashboard?" message "When disabled you are unable to access it for the current user account. You must enable it to be able to open it. It would be a good idea to disable it for computers with less RAM to save memory consumption." & return & return & psValue buttons {"Cancel", "Clear", toggleBut} cancel button 1 default button 3

if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.dashboard mcx-disabled -bool " & sTz
else
	do shell script "defaults delete com.apple.dashboard mcx-disabled"
	set bT to "You've decided to clear the preference."
end if
tell application "System Events"
	display alert "Dock - Restarted required" message bT & " For your changes to take effect, you'll need to restart the Dock. Would you like to restart it now?" buttons {"Restart Later", "Restart Dock"} cancel button 1
	do shell script "killall Dock"
end tell