# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Adds a blank tile to the Dock
-- Add a set amount of spacers to the Dock

-- Versions compatible: Leopard (10.5)+
-- Preference Identifier: com.apple.dock
-- Preference Key: persistent-apps/persistent others -array-add
-- Preference location: ~/Library/Preferences/com.apple.dock

set MacVer to do shell script "sw_vers -productVersion"
set MacVer to "10.5.0"
set Min to "10.5.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". The settings that this script changes will only work properly with Mac OS Leopard (10.5) and later. You cannot use this feature at this time. This feature isn't available at this time." buttons ["OK"] as warning cancel button 1
else
	set defaultHD to (path to system folder) as string
	set tIcon to defaultHD & "Library:CoreServices:Dock.app:Contents:Resources:Dock.icns"
	set tD to (display dialog "Enter the number of spacers you wish to add. If you want them to be on which ever side, choose the action that corresponds to the side you wish to add it to. The Dock will automatically be restarted after choosing an action." & return & return & "Do not enter a high number or else you'll have a painful time removing all the useless spacers that isn't needed." default answer "Enter the number of spacers you want to add..." buttons ["Cancel Action", "Add Left Spacer", "Add Right Spacer"] cancel button 1 with title "Dock - Add Spacers" with icon file tIcon)
	try
		set pSet to (text returned of tD) as number
	on error
		set Fail to "You attempted to set the value as different characters other than numbers, but this feature only accepts numbers for it to work properly! Perhaps you should try again. The following characters will only work when used: 1234567890" as string
		display alert "An Expected Error Occured: Invalid Value!" message Fail as warning buttons {"OK"} cancel button 1 default button 1
	end try
	if the button returned of tD is "Add Left Spacer(s)" then
		repeat pSet times
			do shell script "defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=spacer-tile ;}'"
		end repeat
	else
		repeat pSet times
			do shell script "defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type=spacer-tile ;}'"
		end repeat
	end if
	do shell script "killall Dock"
end if