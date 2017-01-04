# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Allows the use of a metal window background for dialogs and the windows
-- Use the Metal Window Appearance. Partially works.

-- Versions compatible: Tiger (10.4.11)+
-- Preference Identifier: 
-- Preference Key: NSGrayBackground
-- Preference location: ~/Library/Preferences/.GlobalPreferences.plist
-- Default value (boolean): 0

set toggleBut to "Enable"
set tZ to "enable"
set sTz to "YES"
set bT to "You chose to enable the metal window appearance."

# set MacVer to do shell script "sw_vers -productVersion"
set MacVer to "10.4.11"
set Min to "10.4.11" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". The metal window appearance isn't available for your current version of Mac OS. You must be using Mac OS Tiger " & Min & " or later in order for this to work!" buttons ["OK", "More Information"] as warning cancel button 1
	do shell script "open http://support.apple.com/kb/TA24901"
else
	try
		set prValue to do shell script "defaults read -g NSGrayBackground -bool"
		if prValue = "0" then
			set psValue to "The metal window appearance is disabled."
		else
			set psValue to "The metal window appearance is enabled. In places such as System Preferences, you'll be able to see the metal windows and dialogs."
			set toggleBut to "Disable"
			set tZ to "disable"
			set sTz to "NO"
			set bT to "You chose to disable the metal window appearance."
		end if
	on error
		set psValue to "The metal window appearance is disabled by default."
	end try
	display alert "Would you like to " & tZ & " the metal window appearance?" message "If enabled, most of the windows and dialog boxes will have a gray background appearance giving it a classic feel. This may not work for all applications." & return & return & psValue buttons {"Cancel", "Clear", toggleBut} cancel button 1 default button 3
	if the button returned of the result is toggleBut then
		do shell script "defaults write -g NSGrayBackground -bool " & sTz
	else
		do shell script "defaults delete -g NSGrayBackground"
		set bT to "You've decided to clear the preference."
	end if
	display alert "Changes Applied" message bT & " The change will take effect the next time you open an application/restart an application that is in use. The change may not work for some applications." buttons ["OK"]
end if