# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

set MacVer to do shell script "sw_vers -productVersion"

(* 
When enabled, it allows the user to place widgets on the desktop (devmode) there is no known way to stop it from staying on top of all windows natively from the DashboardÉ or is there? When using Lion make sure to turn off the function where the Dashboard appears as a space or it may not function properly when dragging widgets to the desktop to make it transparent (like Snow Leopard) go to 'ð > System PreferenecsÉ > Mission Control' then uncheck 'Show Dashboard as a space' you can change this setting later if you wish to. Although there are limitations as of now for Lion having it transparent.

 Now to get widgets on to the desktop click and hold the mouse on the widget and press the Dashboard button then release it on to the desktop to get it back onto the Dashboard screen just do it the same way but opposite 
 *)

-- Dashboard Enable Developer Mode (DevMode)
-- Versions compatible: Mac OS X Tiger (10.4)+
-- Preference Identifier: com.apple.dashboard
-- Preference Key: devmode
-- Preference location: ~/Library/Preferences/com.apple.dashboard.plist
-- Default value (boolean): false

#set MacVer to do shell script "sw_vers -productVersion"
set MacVer to "10.4.0"
set Lo to "10.4.0"
if MacVer < Lo then
	display alert "Outdated: Not compatible for Mac OS " & MacVer & "!" message "Sorry, your current version of Mac OS X isn't supported by the changes this script does. It will have no effect. Come back if you have Mac OS Tiger (10.4) or later running in order for this feature to work." as warning buttons ["OK"] cancel button 1
end if
set toggleBut to "Enable"
set tZ to "enable"
set sTz to "TRUE"
set bT to "You've decided to enable the Dashboard's developer mode function."
try
	set prValue to do shell script "defaults read com.apple.dashboard devmode"
	
	if prValue = "1" then
		
		set toggleBut to "Disable"
		set tZ to "disable"
		set sTz to "FALSE"
		set bT to "You've decided to disable the Dashboard's developer mode function."
		
		set prValue to "The Developer Mode function of the Dashboard is enabled. You can drag widgets out of the Dashboard to the desktop."
	else
		set prValue to "The Dashboard Developer function is disabled. You cannot drag any widgets to the desktop."
	end if
on error
	set prValue to "Dashboard Developer Mode is disabled by default."
end try
display alert "Would you like " & tZ & " the Dashboard's developer mode function (drag widgets to desktop)?" message "Lets you drag widgets to the desktop. Doesn't function properly if Dashboard shown as a space in Lion. Open this script in the AppleScript Editor for more details." & return & return & prValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.dashboard devmode -bool " & sTz
else
	do shell script "defaults delete write com.apple.dashboard devmode"
	set bT to "You've decided to clear the Dashboard developer mode preference."
end if
# Replace Dock with System Events
tell application "System Events"
	display alert "Dock needs to be relaunched to see changes" message bT & " You have changed your Dashboard settings, in order to see your changes you need to restart the Dock. Would you like to do that now?" buttons {"Restart Later", "Restart Dock"} default button 2 cancel button 1
end tell
do shell script "killall Dock"
(* display alert "Your changes for the Dashboard have taken effect, now open the Dashboard to see it! Click 'OK' to continue." message "Remember if you're using Mac OS X Lion you should make the Dashboard appear transparent (like Snow Leopard) open this script to see more info if you haven't already." *)
end