# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Allows the user to enable remote disc on any Mac regardless of having a MacBook Air or Mac without a CD drive, logout  is required in order for changes to take effect

-- Enable Remote Disc
-- Versions compatible:
-- Preference Identifier: com.apple.NetworkBrowser
-- Preference Keys: EnableODiskBrowsing, ODSSupported
-- Preference location: ~/Library/Preferences/com.apple.NetworkBrowser.plist
-- Default value (boolean): false (if using a Mac that doesn't have remote disc support enabled by default)

try
	set prValue to do shell script ("defaults read com.apple.NetworkBrowser ODSSupported -bool")
on error
	set prValue to ("Not Set")
end try

display alert "Would you like to enable Remote Disc?" message "Allows the use of Remote Disc without needing a MacBook Air, useful if the disc drive is broken of a Mac or unusable." & return & return & "Current setting (1 = Enabled, 0 = Disabled): " & prValue buttons {"Cancel", "Enable", "Disable"} default button 3 cancel button 1
if the button returned of the result is "Enable" then
	-- Enable Remote Disc Browsing
	do shell script "defaults write com.apple.NetworkBrowser EnableODiskBrowsing -bool TRUE"
	do shell script "defaults write com.apple.NetworkBrowser ODSSupported -bool true"
else
	-- Disable Remote Disc Browsing (default on Macs with disc drives)
	do shell script "defaults write com.apple.NetworkBrowser EnableODiskBrowsing -bool false"
	do shell script "defaults write com.apple.NetworkBrowser ODSSupported -bool false"
end if
display alert "The changes you've made will take effect the next time you login to the current user account." message "Would you like to logout now?" buttons {"Cancel", "Log Out…"} cancel button 1
tell application "System Events" to log out
end