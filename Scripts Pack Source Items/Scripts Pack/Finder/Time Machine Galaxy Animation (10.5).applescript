# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Disable the Time Machine Galaxy Animation

-- Versions compatible: Mac OS X Tiger (10.5)+
-- Preference Identifier: com.apple.Finder
-- Preference Key: _FXShowBackgroundAnimation
-- Preference location: ~/Library/Preferences/com.apple.Finder.plist
-- Default value (boolean): NO

(*
set MacVer to do shell script "sw_vers -productVersion"
set Lo to "10.5.0"
if MacVer < Lo then
	display alert "Outdated: Not compatible for Mac OS " & MacVer & "!" message "Sorry, your current version of Mac OS X isn't supported by the changes this script does. It will have no effect. Come back if you have Mac OS Leopard (10.5) or later running in order for this feature to work where Time Machine is available." as warning buttons ["OK"] cancel button 1
end if
*)
set toggleBut to "Disable"
set tZ to "disable"
set sTz to "NO"
set bT to "You've decided to disable the Time Machine galaxy animation."
try
	set prValue to do shell script "defaults read com.apple.Finder _FXShowBackgroundAnimation"
	
	if prValue = "0" then
		
		set toggleBut to "Enable"
		set tZ to "enable"
		set sTz to "YES"
		set bT to "You've decided to enable the Time Machine galaxy animation."
		
		set prValue to "The Time Machine galaxy animation is disabled. It will not animate and will have a static background instead."
	else
		set prValue to "The Time Machine galaxy animation is enabled."
	end if
on error
	set prValue to "The Time Machine galaxy animation is enabled by default."
end try
display alert "Would you like to " & tZ & " the Time Machine galaxy animation?" message "When you enter Time Machine, the background of it will animate, should you disable it to improve performance or should you keep it fancy?" & return & return & prValue buttons {"Cancel", "Clear", toggleBut} default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.Finder _FXShowBackgroundAnimation -bool " & sTz
else
	do shell script "defaults delete com.apple.Finder _FXShowBackgroundAnimation"
	set bT to "You've decided to clear the Time Machine background animation preference."
end if
display alert "Changes Applied!" message bT & " Your changes should have taken effect."
end