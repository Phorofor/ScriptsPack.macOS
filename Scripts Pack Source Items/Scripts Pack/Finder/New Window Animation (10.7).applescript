# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Disables the new window zoom type animation when opening a new document in some applications

-- Versions compatible: macOS X Lion (10.7)+
-- Preference Identifier: NSGlobalDOmain
-- Preference Key: NSAutomaticWindowAnimationEnabled
-- Preference location: ~/Library/Preferences/NSGlobalDomain.plist
-- Default value (boolean): YES

set toggleBut to "Disable Animation"
set tZ to "disable"
set sTz to "NO"
set bT to "You've decided to disable the new window animation."

(*
set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.7.0" as string
if MacVer < Min then
	display alert "Outdated macOS Version!" message "You're using macOS " & MacVer & ". The new window animation is only available in macOS Lion (10.7)+ and is not supported by your current version of macOS." buttons ["OK"] as warning cancel button 1
	
else
*)
try
	
	set prValue to do shell script "defaults read NSGlobalDomain NSAutomaticWindowAnimationEnabled -bool"
	if prValue = "YES" then
		set prValue to "🔲 The new window animation is currently enabled."
	else
		set prValue to "🔴 The new window animation is currently disabled, you won't see the 'zoom' window effect when a window is opened. (such as the 'Empty Trash' dialog)"
		set toggleBut to "Enable Animation"
		set tZ to "enable"
		set sTz to "YES"
		set bT to "You decided to enable the new window animation"
	end if
on error
	set prValue to "🔳 The new window animation is enabled by default."
end try
end

display alert "Would you like to " & tZ & " the new window animation?" buttons {"Cancel", "Clear", toggleBut} cancel button 1 default button 3 message "Such as the new window popup zoom when creating a file in TextEdit or when emptying the trash." & return & return & prValue

if the button returned of the result is toggleBut then
	-- Put back the new window animation (default setting)
	do shell script "defaults write NSGlobalDomain NSAutomaticWindowAnimationEnabled -bool " & sTz
else
	do shell script "defaults delete NSGlobalDomain NSAutomaticWindowAnimationEnabled"
end if
display alert bT & " You may need to login to this user again for changes to take effect." message "Hold down Option, Command, Shift and Q (⌥⌘⇧Q) to logout now or you can do this yourself manually" buttons ["Cancel", "Log Out…"] default button 2 cancel button 1
#tell application "System Events" to log out
end