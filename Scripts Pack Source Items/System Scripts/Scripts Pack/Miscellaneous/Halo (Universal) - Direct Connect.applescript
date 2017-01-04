# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

(* 
ALL WEBSITES MENTIONED HERE MAY HAVE DIFFERENT TERMS & CONDITIONS WHEN USING THEM.

Halo is owned by Bungie.
I am NOT affiliated with any of the companies or websites mentioned here in any sort of way!

Opens the Halo application and directly connects to the specified IP address of a Halo server. This will not work with the PPC version of Halo. The Universal version of Halo runs on both PPC and Intel processors and is required in order to use this script!

It may freeze for a while in Lion, wait a bit and it will work.

For a list of Halo Combat Evolved servers you can visit here for one by Gametracker:

http://www.gametracker.com/search/?search_by=name_ip&query=&game=halo&loc=_all&sort=&order= 

Some servers may require you to have updated your game before you can join.

Direct IP Connect for Halo Universal Mac
*)

try
	set HaloLocationReference to do shell script "defaults read com.Phorofor.ScriptsPack HaloDirectConnect"
	set RelHalo to quoted form of the POSIX path of HaloLocationReference
	set UniversalHaloPath to "Halo Universal Location: " & HaloLocationReference & return & return & "Remember: Incase you chose the wrong file or get errors, you can change the location of the game using the 'Set Halo Location' button."
on error
	set UniversalHaloPath to "You have not set the location for the Halo Universal application. Choose 'Set Halo Location' if you haven't already. If you move Halo.app elsewhere you could set it again by choosing 'Set Halo Location' and then target the working Halo Universal game."
end try
display alert "Halo Universal - Connect Directly" message UniversalHaloPath buttons ["Cancel", "Set Halo Location", "Connect to IP"] cancel button 1 default button 3
if the button returned of the result is "Set Halo Location" then
	set HaloFile to (choose file with prompt "Please select the Halo Universal application in order to connect to an IP.") as string
	set RelHalo to quoted form of the POSIX path of HaloFile
	set HaloZ to do shell script "defaults write com.Phorofor.ScriptsPack HaloDirectConnect " & RelHalo
	display alert "Halo Universal Application Set" message "You set the location for the Halo Universal game to: " & RelHalo
else
	display dialog "Enter the IP address of the Halo server you wish to connect to directly (ex. 127.0.0.1:2303)" with title "Halo Universal - Direct Connect" default answer "Enter IP (use this syntax <IP>:<PORT>)" buttons ["Cancel", "Launch Halo and Connect to IP"] default button 2 cancel button 1 with icon 1
	try
		set pValue to (text returned of result) as string
	end try
	set appLaunch to RelHalo
	try
		set launchHalo to do shell script appLaunch & "/Contents/MacOS/Halo --connect " & pValue
	on error
		display alert "Wait! Stop right there! An error occured!" message "Something wrong has occurred here's a possible reason why: The path you've specified may be invalid. Maybe running applications is restricted for you? Or the way you're entering the IP is invalid. Remember to use the syntax IP:PORT. Also ensure you've located the correct application." as warning
	end try
end if
end