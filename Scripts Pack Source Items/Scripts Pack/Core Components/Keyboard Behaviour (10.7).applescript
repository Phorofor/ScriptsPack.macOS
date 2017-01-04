# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Keyboard Behaviour
-- Versions compatible: macOS 10.7
-- Preference Identifier: GlobalPreferences
-- Preference Keys: ApplePressAndHoldEnabled
-- Preference location: ~/Library/Preferences/.GlobalPreferences.plist
-- Default value (integer): 0

set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.7.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". This feature is only available in Lion (10.7)+ and is not supported by your current version of Mac OS. This script will have no effect!" buttons ["OK"] as warning cancel button 1
else
	
	set tZ to "Use Key Repeat Behaviour"
	set sTz to "NO"
	set bT to "You've decided to use the key repeat behaviour."
	
	try
		set prValue to do shell script "defaults read -g ApplePressAndHoldEnabled"
		if prValue = "NO" then
			set prValue to "The key repeat behaviour is enabled."
			set tZ to "Use Character Accent Behaviour"
			set sTz to "YES"
			set bT to "You've decided to enable the keyboard character accent behaviour."
		else
			set prValue to "The keyboard character accent is enabled."
		end if
	on error
		set prValue to "The Keyboard character accent keys are enabled by default."
	end try
	
	display alert "Change Keyboard Behaviour?" message "In Lion, holding a key will most likely show the character accent for that key or letter when holding it down instead of repeating the key." & return & return & prValue buttons {"Cancel", "Clear", tZ} default button 3 cancel button 1
	if the button returned of the result is tZ then
		do shell script "defaults write -g ApplePressAndHoldEnabled " & sTz
	else
		do shell script "defaults delete -g ApplePressAndHoldEnabled"
	end if
	display alert "GlobalPreferences - Changes Applied!" message bT & " You'll be able to see your changes the next time you restart your applications."
end if