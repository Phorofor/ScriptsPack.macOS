# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>	

-- Select Text in QuickLook

-- Versions compatible: -
-- Preference Identifier: com.apple.Finder
-- Preference Key: QLEnableTextSelection
-- Preference location: ~/Library/Preferences/com.apple.Finder.plist
-- Default value (boolean): NO

set toggleBut to "Enable"
set tZ to "enable"
set sTz to "YES"
set bT to "You've decided to enable the Dashboard's developer mode function."
try
	set prValue to do shell script "defaults read com.apple.Finder QLEnableTextSelection"
		
	if prValue = "1" then
		
		set toggleBut to "Disable"
		set tZ to "disable"
		set sTz to "NO"
		set bT to "You've decided to enable the selection of text in QuickLook."
		
		set prValue to "The select text in QuickLook feature is disabled."
	else
		set prValue to "The selection of text in QuickLook is enabled."
	end if
on error
	set prValue to "The selection of text in QuickLook is disabled by default."
end try
display alert "Would you like to " & tZ & " the selection of text in QuickLook?" message "By default, when a document that contains text (such as a .txt file) you won't be able to select any text. If you click 'Enable' you'll be able to highlight and select text in a previewed file using QuickLook." & return & return & prValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.Finder QLEnableTextSelection -bool " & sTz
else
	do shell script "defaults delete com.apple.Finder QLEnableTextSelection"
	set bT to "You've decided to clear the text selection in QuickLook preference."
end if
display alert "Changes Applied!" message bT & " Your changes should have taken effect."
end