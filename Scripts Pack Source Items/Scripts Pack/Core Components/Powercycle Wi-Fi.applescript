# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Disconnects and Reconnects the Wi-Fi Power state

-- AirPort Power cycle, only when Wi-Fi services are configured. Will not function if unavailable.


set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.6.9" as string
if MacVer > Min then
	set rec to "Wi-Fi"
else
	set rec to "AirPort"
end if
set defaultHD to (get path to system folder) as string
set mcIcon to defaultHD & "Library:CoreServices:Menu Extras:AirPort.menu:Contents:Resources:AirPort.icns"

set apW to "networksetup -setairportpower en1 "

try
	do shell script apW & "off"
	do shell script apW & "on"
on error
	display alert "An Expected Error Occured: Failed" as warning message rec & " failed to refresh. You may not have the required hardware or don't have the required drivers on your computer."
end try