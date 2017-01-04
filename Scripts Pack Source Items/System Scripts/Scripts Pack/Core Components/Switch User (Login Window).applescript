# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Allows the user to switch user accounts without having to close running applications. 
-- Fast User Switching
-- For best performance on computers without very powerful hardware please make sure that you close programs that aren't in use or else the computer may lag when logging in back to this user account.
-- No settings are changed when running this script

set useR to do shell script "whoami"
tell current application
	display alert "Are you sure you want to switch the user on your computer now?" message "This will allow you to switch user account without logging out and closing everything. This takes you to the login window when activated. Login back to resume your work." & return & return & "You're currently using the account '" & useR & "'." buttons {"Cancel", "Sleep", "Switch User"} default button 3 cancel button 1
end tell

set the button_pressed to the button returned of the result
if the button_pressed is "Switch User" then
	do shell script ("/System/Library/CoreServices/Menu' 'Extras/User.menu/Contents/Resources/CGSession -suspend")
else
	ignoring application responses
		delay 1
		tell application "System Events" to sleep
	end ignoring
end if