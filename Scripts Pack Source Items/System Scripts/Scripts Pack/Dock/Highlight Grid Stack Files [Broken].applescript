# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- When enabled, files will bes style list view on the stack
-- Highlight Grid Stack Files on mouseover

-- Versions compatible: Mac OS X Leopard (10.5)+
-- Preference Identifier: com.apple.dock
-- Preference Key: mouse-over-hilte-stack
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (boolean): false

#set MacVer to do shell script "sw_vers -productVersion"
(*set MacVer to "10.5.0"
set Min to "10.5.0"
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". This feature only works with the minimum of Mac OS 10.5 and later. This script will have no effect unless you update your system!" buttons ["OK"] as warning cancel button 1
*)
(*
end if

if MacVer > Min then
	set sZ to "hilite"
end if
if MacVer < "10.4.9" then
	set sZ to "hlite"
end if
*)

try
	set prValue to do shell script "defaults read com.apple.dock mouse-over-" & sZ & "-stack"
	
	set toggleBut to "Enable"
	set tZ to "enable"
	set sTz to "yes"
	set bT to "You've decided to enable highlighting of grid stack files."
	
	if prValue = "1" then
		
		set toggleBut to "Disable"
		set tZ to "disable"
		set sTz to "no"
		set bT to "You've decided to disable highlighting of grid stack files."
		
		set prValue to "The highlight grid stack files on mouseover feature is enabled. You will see a gradient on whichever file you mouseover in the stacks."
	else
		set prValue to "The highlight grid stack files on mouseover feature is disabled. You will not a gradient on whichever file you mouseover in the stacks."
	end if
on error
	set prValue to "The highlight grid stack files on mouseover feature is disabled by default."
end try

set ttR to display alert "Would you like to " & tZ & " grid view mouseover highlighting?" message "This also works with grid view style too. When the cursor is over a file, the gradient highlight will go over to the file that the cursor is pointing at." & return & return & prValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
if the button returned of ttR is toggleBut then
	do shell script "defaults write com.apple.dock mouse-over-" & sZ & "-stack -boolean " & sTz
else
	do shell script "defaults delete com.apple.dock mouse-over-hilite-stack"
	do shell script "defaults delete com.apple.dock mouse-over-hlite-stack"
	tell application "Dock"
		display alert "Dock hightlight grid stack files preference has been cleared." buttons ["OK"]
	end tell
	error number -128
end if

tell application "Dock"
	display alert "Dock - Changes Applied" message bT & " Your changes have been applied but have not yet taken effect. To see those changes you need to restart the Dock. Would you like to restart it now?" buttons ["Don't Restart", "Restart Dock"] cancel button 1 default button 2
end tell
do shell script "killall Dock"
end