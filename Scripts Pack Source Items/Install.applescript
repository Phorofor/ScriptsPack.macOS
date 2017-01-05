# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

# Only works when used from the Scripts Pack disk image
# Non Automator Scripts Pack DMG Installer/Uninstaller (AppleScript & do shell script based). 
# Only installs for current CurrentUser. Click the 'Run' button to install. 

# FOR THE PROCESS TO WORK CORRECTLY, DO NOT MODIFY ANYTHING IN 
# THIS SCRIPT UNLESS YOU KNOW WHAT YOU ARE REALLY DOING.

-- This script is does an 'install' of the Scripts Pack and only works if it is not moved and the original Scripts Pack files are not renamed or moved elsewhere. They must be in the same directory.

-- Notes
-- The green 'tick' icon used in this script is sourced from benrulz on deviantART (http://benrulz.deviantart.com/) (No longer here, need to fix icon path).
-- Now supports installing without directly referencing the disk image location!

-- I need to make the "Save…" button work, it's just a placeholder for now.
-- Wait this is the parts that were gonna be in the original thing!

(* # Old pathing to icon test
set ricon to "/Volumes/Scripts Pack/ Success.icns" as POISX path
with icon (path to resource ricon) as alias)
*)

set ResourcePath to POSIX path of ((path to me as string) & "::Scripts Pack")
set ResourceReferenceQuoted to quoted form of ResourcePath


# This would QuickLook an image to give the impression of a splash screen, no longer there for now as I'll have to place new images	
(*
try
	set spl to POSIX path of ((path to me) & "Welcome to the Scripts Pack Installer.tiff" as string)
	set splRel to quoted form of spl
	do shell script "qlmanage -p " & splRel
on error
	display dialog "Welcome to the Scripts Pack Installer!" & return & "Created by: Phorofor (github.com/Phorofor)" & return & return & "Click 'OK' to start the installer." with icon 1 with title "Scripts Pack Installer - Welcome!" buttons ["Quit", "Start the Scripts Pack Installer"] cancel button 1 default button 2 giving up after 3
end try
*)


tell application "System Events"
	set defaultHD to (get name of startup disk) as string
end tell

#set successIcon to defaultHD & ":Volumes:Scripts Pack:.ScriptsPackInstallerResources:Success.icns"

set successIconReference to POSIX path of ((path to me as string) & "::.ScriptsPackInstallerResources:Success.icns")
set successIcon to quoted form of successIconReference

#set InstallVersionFile to quoted form of "~/Library/Scripts/Scripts Pack/About Scripts Pack/.ScriptsVersion.txt"


set CurrentUser to do shell script "whoami"

(*
set ScriptsPackLocal1 to "~:Library:Scripts:Scripts' 'Pack:About' 'Scripts Pack:.ScriptsVersion.txt"
set ScriptsPackLocal to POSIX path of ScriptsPackLocal1

set ScriptsPackSystem to "/Library/Scripts/Scripts Pack/About Scripts Pack/.ScriptsVersion.txt"
*)

# It's dynamic!
# Detect User Scripts Pack
# This reads a file called ".ScriptsVersion.txt" to get version information
try
	set InstalledVersionUser to (do shell script "cat ~/'Library/Scripts/Scripts Pack/About Scripts Pack/.ScriptsVersion.txt'")
	set NowInstalledVersionUser to "Scripts Pack " & InstalledVersionUser & " is installed for this user. If you wish to reinstall or want to install the recent version of the Scripts Pack, you'll need to uninstall and then come back here. Attempting to install at this moment may fail and not complete successfully." as text
	set InstallState to "2" as number
	set InstallSituation to "Uninstaller" as string
	
	set SoftwareSummaryUser to return & return & NowInstalledVersionUser
on error
	set SoftwareSummaryUser to return & return & "Scripts Pack doesn't appear to be installed for " & CurrentUser & " (this user). You may install the Scripts Pack now if you wish to." as text
	set InstallState to "3" as number
	set InstallSituation to "Installer" as string
end try

# Detect System Scripts Pack
try
	set InstalledVersionSystem to do shell script "cat /'Library/Scripts/Scripts Pack/About Scripts Pack/.ScriptsVersion.txt'"
	set NowInstalledVersionSystem to return & return & "Scripts Pack " & InstalledVersionSystem & " is installed in your System Scripts directory (/Library/Scripts).  This installer is only manages installation of the Scripts Pack for this user." as text
	set SoftwareSummarySystem to NowInstalledVersionSystem
on error
	set SoftwareSummarySystem to return & return & "Scripts Pack does not appear to be installated in your System scripts directory. This installer is only manages installation of the Scripts Pack for this user." as text
end try

set SoftwareSummary to SoftwareSummaryUser & SoftwareSummarySystem

# Start Installer
display alert "Scripts Pack for macOS " & InstallSituation message "If you did not retrieve this disk image from https://github.com/Phorofor/ScriptsPack.macOS, then please proceed with caution." & return & return & "Make sure there aren't multiple copies of the Scripts Pack disk image mounted. If there is then unmount all disk images and mount only one copy of the Scripts Pack disk image in order for it to install properly." & SoftwareSummary buttons ["Cancel", "Uninstall for This User", "Let's Go"] cancel button 1 default button InstallState

if the button returned of the result is "Uninstall for This User" then
	display alert "Confirm Removal of Scripts Pack" message "You can choose to browse the folder by yourself incase you have your own personal scripts in that folder or if you want to keep that version for later." buttons {"Cancel", "Remove", "Browse Folder"} default button 1 cancel button 1
	
	if the button returned of the result is "Browse Folder" then
		# display alert "Would you like to remove the Scripts Packs for " & CurrentUser & "?" message "This process removes the Scripts Pack for the current user. It will fail if Scripts Pack is not placed at its default location or is not installed for this user." buttons {"Cancel", "Uninstall"} default button 2 cancel button 1
		do shell script "open ~/Library/Scripts/"
		#		display dialog "Now delete the 'Scripts Pack' folder in the opened location and empty the Trash to verify your changes. You may have your own scripts there or you can rename the folder if you want to keep your current version of the Scripts. This is why it doesn't delete automatically."
		error number -128
	else
		# If 'Remove' is chosen...
		(*	
		try
			set nanoVerO to do shell script "cat ~/Library/Scripts/Scripts Pack/.ScriptsVersion.txt"
			set nanoVer to quoted form of the POSIX path of nanoVerO
		on error
			set nanoVer to "It appears you do not have the Scripts Pack installed. Or was installed manually not using this automated installer. Attempting to uninstall the Scripts Pack may fail." as text
		end try
	*)
		set dateNom to do shell script "date '+%M-%S-%m-%d-%y'"
		
		-- Skip the dialog spam, there's too many here
		# display alert "Remove scripts for " & CurrentUser & " now?" message "Removes the Scripts Pack folder from the current user's scripts folder which will be placed into the temporary folder which will be deleted upon computer restart. Make sure you don't have anything important in that folder before proceeding." buttons ["Cancel", "Uninstall"] cancel button 1 default button 1
		try
			do shell script "mv -f ~/Library/Scripts/Scripts' 'Pack " & "~" & "/.Trash/Scripts' 'Pack' '" & dateNom
		on error
			display alert "An Expected Error Occured: Removal Failure" message "Required files to remove the Scripts Pack may not be available at this time. You might have renamed a required file or the Trash isn't accessible by the Scripts Pack." & return & return & "Scripts Pack may have already have been removed or is not installed in your user Scripts folder." as warning buttons ["OK"] default button 1
			error number -128
		end try
		
		do shell script "afplay /Applications/iTunes.app/Contents/Resources/complete.aif"
		display dialog "Scripts Pack Successfully Removed!" & return & return & "The Scripts Pack have been removed for '" & CurrentUser & "'." & return & return & "You can now reinstall or install an updated version of the Scripts Pack if you wish to. The actual removed files is in your Trash incase you made a mistake." buttons {"OK"} with icon 1 cancel button 1 with title "Scripts Pack Removed Successfully"
		# Remove
		# & "' on the disk '" & defaultHD *) 
	end if
else
	# Proceed default install
	display alert "Welcome to the Scripts Pack Installer!" message "These scripts were made so you'll be able to use tweak built-in features of macOS. There aren't very many scripts here and more will be made as it expands. If you don't find them useful I recommend that you delete them as soon as possible. You'll be guided through the installation." buttons ["Cancel", "Proceed"] default button 2 cancel button 1
	
	display alert "Would you like to install the Scripts now?" message "For more advanced users or if you want to install it manually, check out the GitHub page for this program. The web location is provided in the Scripts Pack Disk Image." buttons ["Cancel", "Continue"] cancel button 1 default button 2
	# Pointless now, opens the license
	# set openLIC to "/Volumes/Scripts Pack/GPL v3.0" as string
	# set openRLIC to quoted form of openLIC
	# do shell script "open " & openRLIC
	
	
	delay 2
	# Doesn't work, rip
	(*
	display alert "Do you agree to these terms?" message "If you've read the Terms & Conditions, choose whether you agree or not, if you haven't, keep on reading. When you're finished, choose whether you agree or disagree. If you choose that you agree, you agree under the Terms & Conditions under no circumstances. You may not modify it in any way." buttons ["Save...", "I disagree with the terms", "Yes, I totally agree with the terms"] cancel button 1
	*)
	
	(*	if the button returned of the result is "Save..." then
		set saveF to (choose file with prompt "Choose a location to save the GPL version 3.0 Licence.") as string
		set saveL to POSIX path of saveF
		try
			do shell script "cp /Volumes/Scripts' 'Pack/'              '/" & saveL
		on error
			display alert "Expected error!" message "Unable to process the required files. It may be unavailable at this time." buttons ["OK"] cancel button 1
		end try *)
	# Skip the EULA, reduce the dialog spam pls
	(*
	if the button returned of the result is "I disagree with the terms" then
		display alert "Thank you, " & CurrentUser & "!" message "Thank you for being honest with your disagreement. But I disagree about your opinion about the terms & conditions! That doesn't seem right for the both of us now. I won't let you pass." buttons ["OK"] cancel button 1
	else
		*)
	(*	display alert "Are you sure?" message "Wait, you thought I would let you pass this easy right? Well, click 'Proceed & Install' if you really aren't lying about this and are sure you seriously agree with the Terms & Conditions." buttons ["No", "Proceed & Install"] cancel button 1 default button 1 *)
	try
		set Ins0 to "~/Library/Scripts/"
		# set ScriptsPackResources to "/Volumes/Scripts' 'Pack/Scripts' 'Pack/ ~/Library/Scripts/Scripts' 'Pack/"
		
		set ScriptsPackResources to ResourceReferenceQuoted & " ~/Library/Scripts/Scripts' 'Pack/"
		
		
		(* set InsRel0 to quoted form of Ins0
			set InsRel1 to quoted form of ScriptsPackResources *)
		try
			do shell script "mkdir " & Ins0
		end try
		
		do shell script "cp -R " & ScriptsPackResources
	on error
		display alert "An Expected Error Occured: File Error" message "There was an error copying the files. You may have unmounted the Scripts Pack volume during the process or do not have permission to write to the required directory or need to uninstall the scripts in order to install again. If you don't have a scripts directory, try creating it." as warning buttons ["Create Scripts Directory", "OK"] cancel button 2 default button 1
		try
			do shell script "mkdir ~/Library/Scripts/"
			display alert "Scripts Directory Success!" message "The Scripts directory has been created for " & CurrentUser & ". Run the installer again to attempt to install the Scripts Pack." buttons ["OK"] cancel button 1
		on error
			display alert "An Expected Error Occured!" message "Directory creation has failed. You may already have one for this user account or may not have permission to write to your ~/Library folder." buttons ["OK"] default button 1
			error number -128
		end try
	end try
end if

try
	set sVer002 to (do shell script "cat ~/'Library/Scripts/Scripts Pack/About Scripts Pack/.ScriptsVersion.txt'")
on error
	set sVer002 to ""
end try

do shell script "afplay /Applications/iTunes.app/Contents/Resources/complete.aif"
display dialog "Scripts Pack Successfully Installed!" & return & return & "The Scripts Pack have been installed for  '" & CurrentUser & "'." & return & return & "Click 'Continue' if you want to see the summary information." & return & return & "Here are the details of the Scripts Pack version you've installed:" & return & return & "Installed Version: " & sVer002 buttons {"Cancel", "Continue"} with icon 1 cancel button 1 default button 2 with title "Scripts Pack Installer - Success!"

#do shell script "open /Volumes/Scripts' 'Pack/.ScriptsPackInstallerResources/Scripts' 'Pack' 'Installed.rtf"
#Remove
set ResourcePath to POSIX path of ((path to me as string) & "::Scripts Pack")

#& CurrentUser & "' on the disk '" & defaultHD
try
# The Script Menu item for running Applescripts via the menubar.
	display alert "Load Script Menu Item in the menu bar?" message "Would you like to load the Script Menu.menu menu extra to the menubar for quick and easy access to these scripts? Clicking 'No.' does not affect anything for the menu bar." buttons ["No.", "Load Script Menu Item"] default button 2
	if the button returned of the result is "Load Script Menu Item" then
		do shell script "open /System/Library/CoreServices/Menu' 'Extras/Script' 'Menu.menu"
		display alert "Script Menu Item" message "You should be able to see the Script menubar item in the menubar, you can use this to quickly access the scripts. You can remove it in the Applescript Editor preferences or using Command-Click and hold on the menu item you wish to remove and drag it below the menubar then release." default button 1
	end if
end try
# This used launch a script that allowed Scripts Pack to work with Growl, but then I forgot that this script got corrupted in a backup and it only pointed to the unlaunchable corrupted scpt, RIP.
(*
	display alert "Scripts Pack with Growl notifications" message "Some scripts in the Scripts Pack may use Growl as a way to send notifications about events that are happening. You must have Growl 1.3 or later for notifications to become supported properly, you may continue without the setup of notifications." buttons ["Register Scripts Pack with Growl", "Finish Setup"] cancel button 2 default button 2
	
	set GrowlSP to (path to me as string) & "Contents:Resources:Scripts:GrowlR.scpt" as alias
	
	run script GrowlSP
	*)
display alert "Scripts Pack Setup Complete!" message "You've finish setting up the Scripts Pack. You may choose to exit the setup or stare at this dialog." buttons ["Exit Scripts Pack Installer"]
end
#end if
