# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- AirPort Power State
-- Versions compatible: 10.6.9
-- Preference Identifier: 
-- Preference Key:
-- Preference location: /Library/Preferences/
-- Default value (boolean): 0

set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.6.9" as string
if MacVer > Min then
	set rec to "Wi-Fi"
else
	set rec to "AirPort"
end if
#set defaultHD to (get path to system folder) as string
#set mcIcon to defaultHD & "Library:CoreServices:Menu Extras:AirPort.menu:Contents:Resources:AirPort.icns"
set defaultHD to (get path to applications folder) as string
set mcIcon to defaultHD & "System Preferences.app:Contents:Resources:PrefApp.icns"
try
	set loIP to "Local Wireless IP: " & (do shell script "ipconfig getifaddr en1")
on error
	set loIP to "No Local Wireless - 127.0.0.1 (localhost)"
end try
try
	set extIP to "External IP Address: " & (do shell script "curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'")
	if extIP = "External IP Address: " then
		set extIP to "No External IP - Internet Not Available"
	end if
end try

set apW to "networksetup -setairportpower en1 "
set powerAP to do shell script "networksetup -getairportpower en1"
display dialog "Modify the " & rec & " Power?" & return & return & powerAP & return & loIP & return & extIP buttons ["Cancel", "Turn " & rec & " Off", "Turn " & rec & " On"] cancel button 1 with title rec & " Power Change" with icon file mcIcon
set the button_pressed to the button returned of the result
if the button_pressed is "Turn " & rec & " Off" then
	do shell script apW & "off"
else
	do shell script apW & "on"
end if