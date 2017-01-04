# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Shows the Dashboard as an overlay rather than being a space, without needing to use System Preferences. 

-- Show Dashboard as overlay in Lion

-- Versions compatible: Lion (10.7)+
-- Preference Identifier: com.apple.dock
-- Preference Key: dashboard-in-overlay
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (boolean): NO 

(*
set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.7.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". This feature isn't available for your current version of Mac OS X. Maybe it's time to upgrade?" buttons ["OK"] as warning cancel button 1
else
	try
		set prValue to do shell script "defaults read com.apple.dock dashboard-in-overlay"
		if prValue = "1" then
			set psValue to "The Dashboard is set as an overlay. The Dashboard is will not appear as a space. You cannot use the swipe gestures to view the Dashboard."
		else
			set psValue to "The Dashboard is shown as a space. You can use the swipe gestures to access it."
		end if
		error
		set psValue to "The Dashboard is set as a space by default."
	end try
*)

display alert "Would you like to show the Dashboard as an overlay or space?" message "Showing Dashboard as an overlay will be similar to what it was like in Snow Leopard, but you cannot use mouse or trackpad gestures to access it. If that setting is chosen, you may wish to enable hot corners or set a key to open the Dashboard." & return & return & psValue buttons {"Cancel", "Show as a space", "Show as overlay"} cancel button 1 default button 2
if the button returned of the result is "Show as a space" then
	do shell script "defaults write com.apple.dock dashboard-in-overlay -boolean NO"
	set bT to "You've decided to set the Dashboard to appear as a space."
else
	do shell script "defaults write com.apple.dock dashboard-in-overlay -boolean YES"
	set bT to "You've decided to set the Dashboard to appear as an overlay."
end if
tell application "Dock"
	display alert "Dock - Restarted required" message bT & " For the changes to take effect, you'll need to restart the Dock. Would you like to restart it now?" buttons {"Restart it later", "Restart Dock"} cancel button 1
	do shell script "killall Dock"
end tell
# end if