# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Change the animation speed for Mission Control in Lion

-- Preference Identifier: com.apple.dock
-- Versions compatible: Mac OS X Lion (10.7)+
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Preference Key: expose-animation-duration
-- Default value (float): --

set MacVer to do shell script "sw_vers -productVersion"
set MacVer to "10.7.0"
set Min to "10.7.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". Mission Control is not supported for your current version of Mac OS. You'll need to have the minimum version of Mac OS X Lion (10.7) or later in order to use this feature." buttons ["OK", "More Information"] as warning cancel button 1
	do shell script "open http://support.apple.com/kb/SP629"
else
	set defaultHD to (get path to applications folder) as string
	set mcIcon to defaultHD & "Mission Control.app:Contents:Resources:expose.icns"
	try
		set prValue to do shell script "defaults read com.apple.dock expose-animation-duration -float"
		set psValue to "🔲 The speed is currently set as: " & prValue
	on error
		set psValue to "🔴 The currently set value is undefined."
	end try
	display alert "Would you like to set the Mission Control animation speed?" message "Click 'Set' to set the animation speed, or click 'Restore' to return to its default settings." & return & return & psValue buttons {"Cancel", "Set", "Restore"} cancel button 1 default button 2
	if the button returned of the result is "Set" then
		-- A higher number will make it animate slower, a more less number will animate it faster. Setting it as 0 will make it appear instantly and won't be able to see the animation.
		display dialog "Enter a value to set the speed." & return & return & "A higher number will make it animate slower. Set the value as 0.001 for really fast, or use 0.15 for a fast decent animation speed." default answer "Use numbers only for the value" buttons {"Cancel", "Set Value"} default button 2 with icon file mcIcon with title "Set Mission Control Animation Speed"
		try
			set pValue to (text returned of result) as text
		on error
			display alert "The value you entered is invalid!" message "Invalid value! Use only numbers. Make sure that they're not too high or low! Remember that you can also use numbers that are in decimal places as well!" as warning buttons {"OK"} cancel button 1 default button 1
		end try
		do shell script "defaults write com.apple.dock expose-animation-duration -float " & pValue
		display dialog "Current value set for the Mission Control animation speed: " & pValue with title "Value" with icon note
	else
		do shell script "defaults delete com.apple.dock expose-animation-duration"
	end if
	tell application "System Events"
		display alert "Restart required for changes to take effect!" message "The animation speed for Mission Control has been changed! To see the changes you need to restart the Dock. Would you like to restart it now?" buttons {"Don't restart", "Restart now"} cancel button 1
	end tell
	do shell script "killall Dock"
	(* delay 3
	tell application "Dock"
		display alert "The Dock has been restarted successfully. You should be able to see your changes." *)
end if