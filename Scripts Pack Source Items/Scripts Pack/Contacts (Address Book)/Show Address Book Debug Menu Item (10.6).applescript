# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Show Debug Menu in Address Book
-- Versions compatible: Leopard (10.6)+
-- Preference Identifier: com.apple.AddressBook
-- Preference Key: ABShowDebugMenu
-- Preference location: ~/Library/Preferences/com.apple.AddressBook.plist
-- Default value (string): false

set toggleBut to "Show Debug Menu"
set tZ to "show"
set sTz to "true"
set bT to "You've decided that the Address Book should show the debug menu item."

try
	set prValue to do shell script "defaults read com.apple.AddressBook ABShowDebugMenu"
	if prValue = "1" then
		set prValue to "The Address Book's debug menu is now shown." as string
		set toggleBut to "Hide Debug Menu"
		set tZ to "hide"
		set sTz to "false"
		set bT to "You've decided to hide the debug menu."
	else
		set prValue to "The Address Book's debug menu item is hidden. You will not be able to access it." as string
	end if
on error
	set prValue to "The current setting is unknown. The Address Book's debug menu item is hidden by default." as string
end try
display alert "Would you like to " & tZ & " the Address Book's debug menu?" message "Shows a debug menu in the menubar when running the Address Book." & return & return & prValue buttons ["Cancel", "Clear", toggleBut] default button 3 cancel button 1

if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.AddressBook ABShowDebugMenu -bool " & sTz
else
	do shell script "defaults delete com.apple.AddressBook ABShowDebugMenu"
	set bT to "You've decided to clear the preference."
end if
tell application "System Events" to (name of every process)
if the result contains "Address Book" then
	tell application "Contacts"
		display alert "Quit Address Book to see changes" message bT & ". To see the changes you've made, you need quit the Address Book. Would you like to do that now? You'll have to open the Address Book manually." buttons {"Restart Later", "Quit Address Book"} default button 2 cancel button 1
		tell application "Contacts" to quit
	end tell
else
	display alert "Address Book - Changes Applied!" message bT & " Your changes will take effect the next time you open the Address Book." buttons ["Cancel", "Open Address Book"] cancel button 1
	tell application "Contacts" to run
end if