# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Adds a recent items stack to the Dock
-- Add a set amount of recent items stacks to the Dock

-- Versions compatible: Leopard (10.5)+
-- Preference Identifier: com.apple.dock
-- Preference Key: persistent-others
-- Preference location: ~/Library/Preferences/com.apple.dock

set MacVer to do shell script "sw_vers -productVersion"
set MacVer to "10.5.0"
set Min to "10.5.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". The settings that this script changes will only work properly with Mac OS Leopard (10.5) and later. You cannot use this feature at this time. This feature isn't available at this time." buttons ["OK"] as warning cancel button 1
else
	set defaultHD to (path to system folder) as string
	set tIcon to defaultHD & "Library:CoreServices:Dock.app:Contents:Resources:Dock.icns"
	set tD to (display dialog "Enter the number of recent items stacks you would like to have. It will only appear on the right side (or bottom) of the Dock. The Dock will automatically be restarted after adding the stack." & return & return & "[ ! ]: Do not enter a high number or else you'll have a painful time removing all the useless stacks that isn't needed." default answer "Enter the number of recent items stacks you want to add..." buttons ["Cancel Action", "Add Entered amount of Recent Items Stack(s)"] cancel button 1 with title "Dock - Add Recent Items Stack" with icon file tIcon)
	try
		set pSet to (text returned of tD) as number
	on error
		set Fail to "You attempted to set the value as different characters other than numbers, but this feature only accepts numbers for it to work properly! Perhaps you should try again. The following characters will only work when used: 1234567890" as string
		display alert "An Expected Error Occured: Invalid Value!" message Fail as warning buttons {"OK"} cancel button 1 default button 1
	end try
	repeat pSet times
		do shell script "defaults write com.apple.dock persistent-others -array-add '{ tile-data = { list-type = 1; }; tile-type = recents-tile; }'"
	end repeat
end if
do shell script "killall Dock"
end