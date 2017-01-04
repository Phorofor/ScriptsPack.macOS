# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

(*
End/Load All Growl Related Processes

This script kills/starts all Growl related processes. This may be not useful if you use the menu bar method where Growl is in its default location.
*)

set GrowlHelp to "com.Growl.GrowlHelperApp"
set HWGrowl to "com.Growl.HardwareGrowler"
set GSafari to "com.growl.GrowlSafariLoader"
set GTunes to "com.Growl.GrowlTunes"

try
	set defaultHD to (get path to application id "com.Growl.GrowlHelperApp") as string
	set grIcon to defaultHD & "Contents:Resources:Growl.icns"
on error
	display alert "An Expected Error Occured: Growl Not Found" message "Sorry! Growl wasn't able to be found or accessed. You may not have Growl installed or you may not have access to it on this computer. Please make sure you have a clean copy of Growl if it has been modified." as warning buttons ["Go to growl.info", "OK"] cancel button 2
	do shell script "open http://growl.info"
	error number -128
end try

display dialog "Would you like to end all Growl related processes? If the processes is ended, it will stop the following applications if they are running: GrowlHelperApp, HardwareGrowler, GrowlSafari and GrowlTunes" with icon file grIcon buttons ["Cancel Action", "End Processes", "Load Processes"] with title "Growl 1.2.2 - End/Load Growl Processes"

if the button returned of the result is "End Processes" then
	#Quit GrowlHelperApp
	try
		tell application id GrowlHelp to quit
	end try
	# Quit HardwareGrowler
	try
		tell application id HWGrowl to quit
	end try
	# Quit GrowlSafari
	try
		tell application id GSafari to quit
	end try
	# Quit GrowlTunes
	try
		tell application id GTunes to quit
	end try
	
else
	-- You can customize which items you may wish to run. You can edit the entire script if you have any additional applications that only use Growl for certain events to appear.
	
	#Open GrowlHelperApp
	try
		tell application id GrowlHelp to open
	end try
	
	#Open HardwareGrowler
	try
		tell application id HWGrowl to open
	end try
	
	# Remove the comments to enable the loading of the process of these applications when the load action is used in this script.
	(*
	
#Open GrowlSafari
try
	tell application id GSafari to open
end try
*)
	
	(*
#Open GrowlTunes
try
	tell application id GTunes to open
end try

*)
end if