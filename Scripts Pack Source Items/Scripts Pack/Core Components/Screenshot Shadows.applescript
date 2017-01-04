# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Allows the user to disable screenshot shadows when taking a screenshot of a window

-- Disable Screenshot Shadows

-- Versions compatible:
-- Preference Identifier: com.apple.screencapture
-- Preference Key: disable-shadow
-- Preference location: ~/Library/Preferences/com.apple.screencapture.plist
-- Default value (boolean): false 

set toggleBut to "Disable"
set tZ to "disable"
set sTz to "true"
set bT to "You've decided to disable the screenshot shadows, you will no longer see them when you take screenshots."

try
	set prValue to do shell script "defaults read com.apple.screencapture disable-shadow -bool"
	if prValue = "1" then
		set prValue to "Screenshot shadows are currently disabled. You will no longer see those shadows."
		set toggleBut to "Enable"
		set tZ to "enable"
		set sTz to "false"
		set bT to "You've decided to enable the screenshot shadows when taking screenshots."
	else
		set prValue to "Screenshot shadows are currently enabled."
	end if
on error
	set prValue to "The screenshot shadows are enabled by default."
end try
display alert "Would you like to " & tZ & " screenshot shadows?" message "The screenshot shadows appear when taking a screenshot of a window, you can disable this feature by clicking 'Disable'. SystemUIServer will be restarted after choosing a setting." & return & return & prValue buttons {"Cancel", "Clear", toggleBut} cancel button 1 default button 3
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.screencapture disable-shadow -bool " & sTz
else
	do shell script "defaults delete com.apple.screencapture disable-shadow"
	set bT to "You've decided to clear the preference"
	
end if
do shell script "killall SystemUIServer"
display alert "Your changes have been applied!" message bT & " You should be able to see your changes take effect." buttons ["OK"] cancel button 1
end