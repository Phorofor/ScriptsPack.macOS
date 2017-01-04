# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Manually remove a preferred network using shell scripts and dialogs, administrator password is required to make changes

-- Remove a preferred AirPort network 
-- (UNTESTED) RUN AT YOUR OWN RISK. Unpredictable results may occur

tell application "Finder"
	set defaultHD to (get name of startup disk) as string
end tell
set apIcon to defaultHD & ":System:Library:PreferencePanes:Network.prefPane:Contents:Resources:Network.icns"
set useR to do shell script "whoami"
display alert "Remove a preffered AirPort (Wi-Fi) network?" message "You can view them in the Network preferences using ð > System PreferencesÉ > Network > AdvancedÉ > Wi-Fi (or AirPort if you're not using Lion)" buttons ["Cancel", "Remove Preferred Network"] default button 2 cancel button 1
set netValue to display dialog "Enter the name of the preferred network you wish to remove. You'll need to enter an administrator password in order to change the settings." default answer "Enter name of network to remove..." with title "Remove Preferred AirPort Network" with icon file apIcon
do shell script "networksetup -removepreferredwirelessnetwork en1 " & netValue with administrator privileges