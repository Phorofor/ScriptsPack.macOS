# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Set the Dock magnification higher than 128. 

-- Make Dock Magnify Larger 

-- Versions compatible: 
-- Preference Identifier: com.apple.dock
-- Preference Key: largesize
-- Preference location: ~/Library/Preferences/com.apple.dock
-- Default value (integer): -- 

try
	set pValue to do shell script "defaults read com.apple.dock largesize -int"
	set prValue to "The current set magnification icon zoom size is: " & pValue & "."
on error
	set prValue to "The current set value for the Dock magnification is unknown."
end try
set defaultHD to (get path to system folder) as string
set tIcon to defaultHD & "Library:CoreServices:Dock.app:Contents:Resources:Dock.icns"

display dialog "Enter a number to set the icon magnification size in the Dock. The highest available is 512. The Dock will automatically be restarted. Entering a number higher than 512 will have no effect." & return & return & prValue default answer "Enter a number from 16 to 512 to set size" buttons ["Cancel", "Set Magnify Size to Entered Value"] default button 2 cancel button 1 with title "Dock - Set Magnification Icon Size" with icon file tIcon
try
	set pSet to (text returned of result) as number
on error
	set Fail to "You attempted to set the value as different characters other than numbers, but this feature only accepts numbers for it to work properly! Perhaps you should try again. The following characters will only work when used: 1234567890" as string
	display alert "An Expected Error Occured: Invalid Value!" message Fail as warning buttons {"OK"} cancel button 1 default button 1
end try
do shell script "defaults write com.apple.dock largesize -int " & pSet
do shell script "killall Dock"