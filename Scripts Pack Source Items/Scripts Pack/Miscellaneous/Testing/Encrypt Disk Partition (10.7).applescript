# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Encrypt Disk. Not tested on newer versions.

(*
set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.7.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & " which does not support CoreStorage natively. This script will only work properly with Mac OS Lion (10.7) and later. You cannot use this feature at this time. Update your system so you can use this feature." buttons ["OK", "More Information"] as warning cancel button 1
	do shell script "open http://support.apple.com/kb/SP629"
	error number -128
end if
*)

tell application "System Events"
	set startDriv to (get name of startup disk) as string
end tell

set Icon_1 to startDriv & ":System:Library:Extensions:IOStorageFamily.kext:Contents:Resources:External.icns"


display dialog "Would you like to encrypt a partition of a disk by converting it to Apple CoreStorage with a passphrase? You should read the information first if you have not experienced it before using the 'More Information' action." buttons ["Nope", "More Information", "Encrypt Disk"] with title "Encrypt Disk Partition" cancel button 1 with icon file Icon_1 default button 2

if the button returned of the result is "More Information" then
	set s1 to (((path to me) as text) & "EncryptDisk.rtf")
	set s1 to POSIX path of s1
	set open1 to quoted form of s1
	try
		set info1 to "open " & open1
		do shell script info1
		error number -128
	end try
end if
-- Get partition/volume's name
set encD to display dialog "Enter the name of the disk's partition you wish to encrypt with a passphrase. Make sure that you type it correctly." default answer "<Enter name of partition you want to encrypt>" with title "Encrypt Disk"

set VolName to (text returned of encD)
if VolName = startDriv then
	set strtDisk to display alert "You appear to be trying to encrypt the Startup Disk (" & startDriv & ")" as warning message "You entered the name of the startup disk. If you wish to encrypt the startup disk you should used FileVault which is already built-in. You can view it by going to: Apple (ð) > System PreferencesÉ > Security & Privacy > FileVault (or you can use the button below) then you should follow the instructions provided." buttons ["Security & Privacy Preferences", "More Information", "OK"] cancel button 3 default button 1
	if the button returned of the result is "More Information" then
		do shell script "open http://support.apple.com/kb/HT4790"
	else
		do shell script "open /System/Library/PreferencePanes/Security.prefPane"
	end if
	error number -128
end if

set DiskEnc to "/Volumes/" & (text returned of encD)
set DiskEnc to POSIX path of DiskEnc
set DiskEnc to quoted form of the POSIX path of DiskEnc
-- Set password
set passWd to display dialog "Enter the passphrase you wish to set for the targetted volume. It should be mounted at /Volumes/" & VolName buttons ["Abort", "OK"] default answer "" cancel button 1 with title "Encrypt Disk - Set Passphrase" with hidden answer

set passPhrase to text returned of passWd

set verPassWd to display dialog "Please verify the passphrase in order to encrypt the targeted disk." & return & return & "[WARNING]: If you forget the passphrase you will NOT be able to access the data. You should write it down and store it somewhere safe where you can easily recover it." buttons ["Cancel", "Confirm"] default answer "" cancel button 1 with title "Encrypt Disk - Verify Passphrase" with hidden answer
if text returned of verPassWd = passPhrase then
	-- Convert the volume
	try
		display alert "DISK ENCRYPTION WARNING!" as warning message "The encryption process may take a few minutes to several hours in order to convert depending on the volume's size. You will not be able to modify a partition's size on the disk once it has been encrypted. While it's being encrypted do not unplug the disk (if there is) or it may cause damage. You can copy files to the disk while it's being encrypted but the performance may temporary become slow." buttons ["Cancel Encryption", "Encrypt " & VolName] cancel button 1
		do shell script "diskutil cs convert " & DiskEnc & " -" & passPhrase
		display dialog "The disk: & VolName & will now be converted into an Apple CoreStorage volume with the passphrase. You are still able to access the disk and write files to it but may become slow. If you have access to a command line utility such as using X11's xTerm you can use the command 'diskutil cs list' to check the progress." default answer "Click the copy command to clipboard button to set 'diskutil cs list' to it, or just copy the text here. Use it in an application like Terminal." buttons ["Copy 'diskutil cs list' to the clipboard", "Exit"] default button 2 cancel button 2
		set the clipboard to "diskutil cs list"
	on error
		display alert "An Expected Error Occured: Encryption Failed!" as warning message "The disk '" & VolName & "' could not be encrypted. It may not exist or isn't mounted check whether if it is formatted correctly."
		error number -128
	end try
else
	display alert "An Expected Error Occured: Encrypt Failed" message "The disk could not be converted into an encrypted CoreStorage volume because the passwords you entered did not match." as warning
end if
end