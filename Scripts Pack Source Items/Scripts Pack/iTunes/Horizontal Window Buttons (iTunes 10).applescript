# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

(* Makes the window buttons horizontal in iTunes 10 and later rather than being in the vertical orientation. *)

-- iTunes Horizontal Window Buttons
-- Does not appear to be working for Lion ???????

-- Versions compatible: Leopard (10.5.8)+
-- Application version: iTunes 10+
-- Preference Identifier: com.apple.iTunes
-- Preference Key: full-window
-- Preference location: ~/Library/Preferences/com.apple.iTunes.plist
-- Default value (integer): -0

-- This checks the version
set MacVer to do shell script "sw_vers -productVersion"
set Lo to "10.5.8" as string
set FtS to "10.6.9" as string
if MacVer < Lo then
	display alert "Feature Not Supported for " & MacVer & "!" message "Sorry, your current version of Mac OS X isn't supported for the settings to work correctly. You need to have at least Mac OS 10.5.8 (Leopard) in order to run iTunes 10 and for the feature to work." as warning buttons ["OK"] cancel button 1
else
	set toggleBut to "Horizontal"
	set tZ to "horizontal"
	set sTz to "-1"
	try
		set prValue to do shell script "defaults read com.apple.iTunes full-window"
		if prValue = "-1" then
			set prValue to "The iTunes window buttons are horizontal and shows the title bar just like in iTunes 9 and lower." as string
			set toggleBut to "Vertical"
			set tZ to "vertical"
			set sTz to "0"
		else
			set prValue to "The iTunes window buttons are vertical and hides the title bar to save space." as string
		end if
	on error
		set prValue to "The current setting is unknown. The iTunes window buttons are vertical by default." as string
	end try
	if MacVer > FtS then
		set ftSupport to return & return & "[Operating System]: This feature may not work at this time. The script may have no effect when changing a setting."
	else
		set ftsSupport to ""
	end if
end if
set defaultHD to (get path to applications folder) as string
set mIcon to defaultHD & "iTunes.app:Contents:Resources:iTunes.icns"

display alert "Would you like to make the iTunes window " & tZ & "?" message "If horizontal is chosen, the window buttons in iTunes will change to the horizontal orientation just like in iTunes 9 and will show the title bar." & return & return & prValue & ftSupport buttons ["Cancel", "Clear", toggleBut] cancel button 1 default button 3
if the button returned of the result is "Horizontal" then
	do shell script "defaults write com.apple.iTunes full-window " & sTz
else
	do shell script "defaults delete com.apple.iTunes full-window"
	display dialog "You've decided to clear the preference. The next time you restart or launch iTunes you'll be able to see the changes." with title "iTunes - Preference Cleared!" buttons ["OK"] cancel button 1 default button 1 with icon file mIcon
end if
tell application "System Events" to (name of every process)
if the result contains "iTunes" then
	tell application "iTunes"
		display alert "Quit iTunes for changes to take effect?" message "You've set the window buttons to be " & tZ & ". In order to see your changes, iTunes will need to be relaunched. Quit iTunes now?" buttons ["Don't Quit iTunes", "Quit iTunes"] cancel button 1 default button 2
		tell application "iTunes" to quit
	end tell
else
	display dialog "You've set the window buttons to become " & tZ & "." & return & return & "You'll be able to see your changes the next time you open iTunes." with title "iTunes - Changes Applied!" buttons ["Exit", "Open iTunes"] cancel button 1 default button 2 with icon file mIcon
	tell application "iTunes" to run
end if
end