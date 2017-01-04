# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Restrict user from accessing the main features of Finder

-- Use Simple Finder
-- Versions compatible:
-- Preference Identifier: com.apple.finder
-- Preference Keys: InterfaceLevel
-- Preference location: ~/Library/Preferences/com.apple.finder.plist
-- Default value (string): standard

(* on run
	set cSz to random number from -133.0 to 9000
	try
		display dialog sZ & return & return & "To confirm your action, please enter the numbers below:" & return & return & cSz default answer "" with hidden answer
		if cZa ­ cSz then
			set pValue to (text returned of result) as number
			display alert "An Expected Error Occured: Verify Failed!" message "" as warning
	end try *)

set defaultHD to (get path to system folder) as string
set mcIcon to defaultHD & "Library:CoreServices:Finder.app:Contents:Resources:Finder.icns"
set cSz to random number from -133.0 to 9000 as string
(* display dialog "To make changes to your user Finder settings, please enter the numbers below:" & return & return & cSz default answer "" buttons ["Cancel", "Confirm"] with icon file mcIcon with title "Verify to make changes" with hidden answer
set pValue to (text returned of result) as string
if pValue is not cSz then
display alert "An Expected Error Occured: Verify Failed!" message "You did not enter the required numbers. You must include all the symbols and decimals too!" as warning buttons ["OK"] cancel button 1
if pValue is cSz then *)
try
	set prValue to do shell script "defaults read com.apple.finder InterfaceLevel"
	if prValue = "simple" then
		set prValue to "The Finder is currently set as the simple interface. You cannot access most of the features and is limited." as string
	else
		set prValue to "The Finder is currently set as the standard interface mode. You can access the main features." as string
	end if
on error
	set prValue to "The current setting is unknown. The interface for Finder is set as standard by default." as string
end try
set useR to do shell script "whoami"

display alert "Use Simple Finder or Standard Finder for " & useR & "?" message "When Simple Finder is in use, the current user will be limited to some of its features. This can be a great way to secure your files." & return & return & prValue buttons {"Cancel", "Use Standard Finder", "Use Simple Finder"} default button 2 cancel button 1

if the button returned of the result is "Use Standard Finder" then
	do shell script "defaults write com.apple.finder InterfaceLevel standard"
	set bT to "You've set the Finder to be set as its standard interface for " & useR & "."
else
	do shell script "defaults write com.apple.finder InterfaceLevel simple"
	set bT to "You've set the Finder to be set as the simple interface for " & useR & "."
	(* set sZ to "You're about to set the Finder to its simple interface for " & useR & "." *)
end if
tell application "System Events" to (name of every process)
if the result contains "Finder" then
	tell application "Finder"
		display alert "Restart needed for changes to take effect." message bT & " In order to see your changes, you'll need to restart the Finder. You can choose to restart it later if you wish to." buttons ["Restart Later", "Restart Now"] cancel button 1 default button 2
	end tell
	do shell script "killall Finder"
else
	display alert "Finder - Changes Applied!" message bT & ". You'll be able to see your changes the next time you run Finder."
end if
end
end