# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Disables the dialog when opening a downloaded application or file the first time on the computer. Disable the function at your own risk. 
-- File Quarantine

-- Versions compatible: --
-- Preference Identifier: com.apple.LaunchServices
-- Preference Key: LSQuarantine
-- Preference location: ~/Library/Preferences/com.apple.LaunchServices.plist
-- Default value (boolean): YES

set chCMD to "defaults write com.apple.LaunchServices LSQuarantine -bool " as string
set toggleBut to "Disable"
set tZ to "disable"
set sTz to "NO"
set useR to do shell script "whoami"
try
	set prValue to do shell script "defaults read com.apple.LaunchServices LSQuarantine"
	if prValue = "1" then
		set prValue to "The File Quartine feature is enabled. It isn't recommended that you change this setting as it checks for known malware unless you really know what you are doing." as string
	else
		set prValue to "[ ! WARNING ! ]: The File Quartine feature is disabled. File Quartine checks for known malware and is recommended to keep it enabled, unless you really know what you're doing." as string
		set toggleBut to "Enable"
		set tZ to "disable"
		set sTz to "YES"
	end if
on error
	set prValue to "File Quartine is enabled by default." as string
end try
display alert "Would you like to enable or disable the File Quarantine feature?" buttons {"Cancel", "Clear", toggleBut} message "Allows you to disable the file verification dialog when downloading a file that is run for the first time on the computer. Disable the dialog at your own risk!" & return & return & prValue cancel button 1 default button 3
if the button returned of the result is "Enable" then
	-- Enable file verification (default setting)
	do shell script chCMD & sTz
	set pSet to "The File Quartine feature is now enabled. It will now notify if known malware is detected and show the 'Are you sure you want to open?' dialog." as string
else
	-- Disable file verification
	display alert "Wait! That's a dangerous action, " & useR & "!" message "The option you are choosing is at your own risk and is not recommended. The File Quarantine feature checks for known malware. You're responsible for any harm done to your own computer. You can change this setting later. Click 'Proceed' to make the changes, or click 'Back Away' if you wish to not make changes." buttons {"Back Away", "Proceed"} default button 1 as warning cancel button 1
	set theAnswer to button returned of the result
	if theAnswer is "Proceed" then
		do shell script chCMD & sTz
		set pSet to " The File Quartine feature is now disabled. You will not see the 'Are you sure you want to open this file?' dialog again. Don't download anything suspicious that will mess up your computer." as string
	end if
end if
display alert "File Quarantine - Changes Applied" message pSet