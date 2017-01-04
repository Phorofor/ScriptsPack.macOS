# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Makes selected folders (also works with files) invisible without having to use any third party application (folder version)

-- Make Folders Invisible (EXPERIMENTAL)
-- Features need to be added:
-- Add the ability to be able to apply changes to multiple files

display alert "Would you like to make a file invisible or visible?" buttons {"Cancel", "Invisible", "Visible"} cancel button 1 default button 1 message "Makes the specified file(s) or folder(s) invisible or visible without the need of a 3rd party application! Only works with files you have permission to modify."
if the button returned of the result is "Invisible" then
	set selectedFile to display dialog "Enter the folder location of what you wish to make invisible." default answer "<Folder location>" as string with icon 1 with title "Enter folder location"
	set filePath to POSIX path of selectedFile
	try
		do shell script "chflags hidden " & filePath
		display alert "Changes applied!" message "Here's the location of the folder you made to be visible:" & return & return & filePath
	on error
		display alert "A expected error occured!" message "This error can occur if the folder you have selected may not be one where you have permission to modify them. Please change its permissions in order to do so! Or you have entered an invalid folder path to make invisible."
	end try
else
	set selectedFile to display dialog "Drag folder or enter the folder location of what you wish to make invisible" default answer "<Folder location>" as string with icon 1 with title "Enter folder location"
	set filePath to POSIX path of selectedFile
	try
		do shell script "chflags nohidden " & filePath
		display alert "Changes applied!" message "Here's the location of the folder you made to be visible:" & return & return & filePath
	on error
		display alert "A expected error occured!" message "This error can occur if the folder you have selected may not be one where you have permission to modify them. Please change its permissions in order to do so! Or you have entered an invalid folder path to make visible."
	end try
end if