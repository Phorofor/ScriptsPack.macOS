# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

set MacVer to do shell script "sw_vers -productVersion"

set Sdescription to "If the Help Viewer is shown as an application it will act like a regular one, rather than being a floating window. The Help Viewer is usually accessed by clicking on the 'Help' menu item and selecting a topic." as string

-- Help Viewer - Show as application (Developer Mode)
-- Preference: com.apple.helpviewer
-- Preference Key: DevMode
-- Preference location: ~/Library/Preferences/com.apple.helpviewer
-- Default value (string): false

set toggleBut to "Show as Application"
set tZ to "application"
set sTz to "TRUE"
set pSet to "The Help Viewer will be shown as a application. You'll be able to access its menu items and see it on the Dock the next time you open it."
try
	set prValue to do shell script "defaults read com.apple.helpviewer DevMode"
	if prValue = "1" then
		set psValue to "The Help Viewer is currently set to be shown like a regular application. You can access its menu items and you'll be able to see it on the Dock while it's running."
		set toggleBut to "Show as floating window"
		set tZ to "floating window"
		set sTz to "FALSE"
		set pSet to "The Help Viewer will now be shown as a floating window the next time you open it. You cannot access its menu items."
	else
		set psValue to "The Help Viewer is set as a floating window. You cannot access its menu items."
	end if
on error
	set psValue to "The Help Viewer is displayed as a floating window by default."
end try
display alert "Show the Help Viewer as a " & tZ & "?" message Sdescription & return & return & psValue buttons ["Cancel", "Clear", toggleBut] cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.helpviewer DevMode -bool " & sTz
else
	do shell script "defaults delete com.apple.helpviewer DevMode"
end if
display alert "Help Viewer - Changes Applied" message pSet
end