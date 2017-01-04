# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Makes selected files or folders invisible without having to use any third party application
-- Only works with files, not folders

-- [>+<] Features need to be added:
-- Add the ability to be able to apply changes to multiple files
-- Add the ability to hide folders

display alert "Would you like to make a file invisible or visible?" buttons {"Cancel", "Invisible", "Visible"} cancel button 1 default button 1 message "Makes the specified file(s) or folder(s) invisible or visible without the need of a 3rd party application! Only works with files you have permission to modify."
if the button returned of the result is "Invisible" then
	set selectedFile to (choose file with prompt "Please select the file you wish to make invisible") as string
	set filePath to POSIX path of selectedFile
	try
		do shell script "chflags hidden " & filePath
		display alert "Changes applied!" message "Here's the location of the file you made to be invisible:" & return & return & filePath
	on error
		display alert "An Expected Error Occured!" message "This error can occur if the files you have selected may not be ones where you have permission to modify them. Please change its permissions in order to do so!"
	end try
else
	set selectedFile to (choose file with prompt "Please select the file or folder you wish to make visible" with invisibles) as string
	set filePath to POSIX path of selectedFile
	try
		do shell script "chflags nohidden " & filePath
		display alert "Changes applied!" message "Here's the location of the file you made to be invisible:" & return & return & filePath
	on error
		display alert "A expected error occured!" message "This error can occur if the files you have selected may not be ones where you have permission to modify them. Please change its permissions in order to do so! Or you might've selected a file that is already visible. Invisible files show as if it's 'greyed out'"
	end try
end if