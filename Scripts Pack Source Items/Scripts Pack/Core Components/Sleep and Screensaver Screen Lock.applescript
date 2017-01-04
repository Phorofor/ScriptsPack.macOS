# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Lets you set the screensaver lock delay and enable the lock or disable it

-- Enable Screensaver Screen Lock
-- Versions compatible:
-- Preference Identifier: com.apple.screensaver
-- Preference Key: askForPassword, askForPasswordDelay
-- Preference location: ~/Library/Preferences/com.apple.screensaver.plist

set spWARN to return & return & "[Scripts Pack]: The 'Set Lock Delay' action will have no effect. I need to find a way for it to work properly. For now, you'll have to go to  > System Preferences… > Security and set the delay, that's if you have access to it. You are limited to it and cannot customize the delay to the amount you want."

set toggleBut to "Enable Lock"
set tZ to "enable"
set sTz to "1"
try
	set prValue to do shell script "defaults read com.apple.screensaver askForPassword"
	if prValue = "1" then
		set prValue to "Screensaver locking is enabled"
		set toggleBut to "Disable Lock"
		set tZ to "disable"
		set sTz to "0"
	else
		set prValue to "Screensaver locking is disabled"
	end if
on error
	error
	set prValue to "The screensaver lock is disabled by default"
end try
try
	set passDelay1 to do shell script "defaults read com.apple.screensaver askForPasswordDelay"
	set passDelay to "The current set value for the lock delay is: " & passDelay1 & " seconds."
on error
	set passDelay to "The current set value for the lock delay is unknown"
end try
set defaultHD to (path to applications folder) as string
set tIcon to defaultHD & "System Preferences.app:Contents:Resources:PrefApp.icns"
display alert "Would you like to " & tZ & " screensaver locking or set the delay for it?" message "You can choose to " & tZ & " the screensaver locking function. You can also set a delay for the amount of time the lock will trigger after the set delay." & return & return & prValue & return & passDelay & spWARN buttons ["Cancel", toggleBut, "Set Lock Delay"] cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.screensaver askForPassword " & sTz
	set bT to "You've decided to " & tZ & " the screen lock function." as string
else
	set tD to (display dialog "Enter the delay in seconds you wish to start the screen lock after screensaver or sleep begins. Enter 0 for immediate lock. You can also enter decimals." buttons ["Cancel Action", "Set Lock Delay"] cancel button 1 with title "Screensaver - Lock Delay" with icon file tIcon default answer "Enter value in seconds...")
	try
		set pSet to (text returned of tD) as number
		set bT to "You've decided to set the screensaver lock delay to: " & pSet & " seconds."
	on error
		set Fail to "You attempted to set the value as different characters other than numbers, but this feature only accepts numbers for it to work properly! Perhaps you should try again. The following characters will only work when used: 1234567890" as string
		display alert "An Expected Error Occured: Invalid Value!" message Fail as warning buttons {"OK"} cancel button 1 default button 1
	end try
	if the button returned of tD is "Set Delay to Entered Value" then
		do shell script "defaults write com.apple.screensaver askForPasswordDelay real " & pSet
	end if
end if
display alert "Your changes have been applied!" message bT & " In order to see your changes. You'll need to log out. Would you like to do that now?" buttons ["Don't Log Out", "Log Out…"] cancel button 1
tell application "System Events" to log out
end