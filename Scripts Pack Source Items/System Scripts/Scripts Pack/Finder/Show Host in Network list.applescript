# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Shows the current computer under the 'SHARED' list of computers. Only the current user will be able to see it. 

-- Show computer in network list in the shares

-- Versions compatible: --
-- Preference Identifier: com.apple.NetworkBrowser
-- Preference location: ~/Library/Preferences/com.apple.NetworkBrowser.plist
-- Preference Key: ShowThisComputer
-- Default value (boolean): 

set compName to do shell script "hostname"
set useR to do shell script "whoami"

set toggleBut to "Show " & compName & " in the list of networks"
set tZ to "show"
set sTz to "TRUE"
set bT to "You've decided to show this computer in the shared list of networks for " & useR & "."
try
	set prValue to do shell script "defaults read com.apple.NetworkBrowser ShowThisComputer"
	if prValue = "1" then
		set prValue to compName & " is shown for user " & useR & " in the shared list of networks"
	else
		set prValue to compName & " is hidden for user " & useR & " in the shared list of networks."
		set toggleBut to "Hide " & compName & " from the list of networks."
		set tZ to "hide"
		set sTz to "FALSE"
		set bT to "You've decided to hide this computer in the shared list of networks for " & useR & "."
	end if
on error
	set prValue to "The current setting is unknown. This computer is never shown under the shared network list when viewing it using this computer by default."
end try
display alert "Would you like to " & tZ & " this computer in the shared list of networks?" message "By default if your computer has some type of sharing enabled, only other clients will be able to see this computer on their computer. You can show this computer even if you're not using a different one." & return & return & prValue buttons ["Cancel", "Clear", toggleBut] default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.NetworkBrowser ShowThisComputer -boolean " & sTz
else
	do shell script "defaults delete com.apple.NetworkBrowser ShowThisComputer"
	set bT to "You've decided to clear the preference."
end if
tell application "System Events" to (name of every process)
if the result contains "Finder" then
	tell application "Finder"
		display alert "Restart Finder to see changes" message bT & " In order to see the changes you've made, you need to restart Finder. Would you like to do that now?" buttons {"Restart Later", "Restart Finder"} default button 2 cancel button 1
		do shell script "killall Finder"
	end tell
else
	display alert "Finder - Changes Applied" message bT & " The next time you open Finder you'll be able to see the changes."
end if