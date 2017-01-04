# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Enables AirDrop or disables it on Macs with old hardware where AirDrop isn't enabled by default. 

-- Enable AirDrop on older Macs/hardware

-- Versions compatible: Lion (10.7)+
-- Preference Identifier: com.apple.NetworkBrowser
-- Preference Key: BrowseAllInterfaces
-- Preference location: ~/Library/Preferences/com.apple.NetworkBrowser.plist
-- Default value (boolean): --

set defaultHD to (get path to system folder) as string
set mIcon to defaultHD & "Library:CoreServices:CoreTypes.bundle:Contents:Resources:AirDrop"
set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.7.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". The AirDrop feature isn't available for your current version of Mac OS. You must be using Mac OS Lion (10.7) or later in order for this to work!" buttons ["OK", "More Information"] as warning cancel button 1
	do shell script "open http://support.apple.com/kb/SP629"
else
	try
		set prValue to do shell script "defaults read com.apple.NetworkBrowser BrowseAllInterfaces"
		if prValue = "1" then
			set psValue to "AirDrop is currently enabled. You can transfer files to other computers with AirDrop."
		else
			set psValue to "AirDrop isn't enabled right now. You cannot use AirDrop and its features."
		end if
	on error
		set psValue to "AirDrop is enabled by default on Macs with supported hardware. The actions that this script perform only works with older hardware, which have AirDrop disabled by default."
	end try
	display alert "Would you like to disable or enable AirDrop?" message "Enabling it allows the use of AirDrop for the current user account. This script will not work on Macs with the AirDrop enabled by default." & return & return & psValue buttons {"Cancel", "Enable", "Disable"} cancel button 1 default button 2
	
	if the button returned of the result is "Enable" then
		do shell script "defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1"
		set bT to "You chose to enable AirDrop."
	else
		do shell script "defaults write com.apple.NetworkBrowser BrowseAllInterfaces 0"
		set bT to "You chose to disable AirDrop."
	end if
	tell application "System Events" to (name of every process)
	if the result contains "Finder" then
		tell application "Finder"
			display alert "NetworkBrowser - Changes Applied" message bT & " For the changes to take effect, you'll need to restart Finder. Would you like to restart it now?" buttons {"Restart it later", "Restart Finder"} cancel button 1
		end tell
		do shell script "killall Finder"
	else
		display dialog bT & " You'll see your changes the next time you run Finder." buttons ["Cancel", "Open Finder"] with title "NetworkBrowser - AirDrop Changes Applied!" with icon mIcon
		tell application "Finder" to run
	end if
end if