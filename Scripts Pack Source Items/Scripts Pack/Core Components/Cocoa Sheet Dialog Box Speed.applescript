# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Disables the animation/makes it faster for the dialog box that drops down when an alert has occured for certain applications such as Pages, this commonly appears on the dialog boxes such as when you save a document 
-- Set Speed for the 'Sheet' dialog box
-- Versions compatible:
-- Preference Identifier: NSGlobalDOmain
-- Preference Key: NSWindowResizeTime
-- Preference location: ~/Library/Preferences/NSGlobalDOmain.plist
-- Default value (float): 0.02

set defaultHD to (path to applications folder) as string
set tIcon to defaultHD & "System Preferences.app:Contents:Resources:PrefApp.icns"

try
	set prValue to do shell script "defaults read NSGlobalDomain NSWindowResizeTime"
	set psValue to "The save & open dialog speed is currently set as: " & prValue as string
on error
	set psValue to "The current setting is unknown."
end try
try
	if prValue > "8" then
		set noIFY to return & return & "[Defaults]: You seem to be using an animation speed that is too slow and that will take long. This can cause the spinning rainbow cursor while the animation takes place until it is finished. It's recommended to set the animation speed to something faster to prevent this."
	else
		if prValue < "8" then
			set noIFY to ""
		end if
	end if
on error
	set noIFY to ""
end try
display alert "Would you like to speed up the save and open dialog box?" buttons {"Cancel", "Set Speed", "Restore"} message "Choosing restore will return to its default delay setting. The dialog appears for most applications when such as when using a save option or open option. Usually under its File dropdown menu." & noIFY & return & return & psValue cancel button 1
if the button returned of the result is "Set Speed" then
	-- Set dialog delay
	display dialog "Enter a value to set the speed for the save & open dialog box." & return & return & "Use 0.001 for it to appear instantly. A higher value makes it appear slower." default answer "Enter a value using only numbers" buttons {"Cancel", "MehÉ", "Set Value"} with title "Dialog Box - Set Speed" with icon file tIcon default button 3
	try
		set pValue to (text returned of result) as number
		
	on error
		display alert "The value you entered is invalid!" as warning message "Invalid value, use only numbers. Make sure that they're not too high or low! Remember that you can also use numbers that are in decimal places as well!" buttons {"OK"} cancel button 1 default button 1
	end try
	do shell script "defaults write NSGlobalDomain NSWindowResizeTime " & pValue
	
	display alert "Dialog Box - Success, settings have been applied!" message "You've set the current value to: " & pValue & return & return & "The next time you open an application that features the common 'Save & Open' dialog, you'll be able to see the changes take effect."
else
	-- Restore default delay
	do shell script "defaults delete NSGlobalDomain NSWindowResizeTime"
	display dialog ("Your changes have been applied.") & return & "The save dialog box settings have been reset to its default settings." buttons {"OK"} with icon note default button 1 with title "Save dialog box - Changes saved"
end if
end