# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- The Dock will also include hidden files when browsing through files by using the stacks feature of it when enabled.
-- Show Hidden Files in Dock when using stacks

-- Versions compatible: --
-- Preference Identifier: com.apple.dock
-- Preference Key: AppleShowAllFiles
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (boolean): false

set MacVer to do shell script "sw_vers -productVersion"
set MacVer to "10.5.0"
set Min to "10.5.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". This feature only works with the minimum of Mac OS 10.5 and later. This script will have no effect unless you update your system!" buttons ["OK"] as warning cancel button 1
else
	try
		set prValue to do shell script "defaults read com.apple.dock AppleShowAllFiles -boolean"
		if prValue = "false" then
			set prValue to "The Dock isn't showing hidden files. You cannot see invisible files or browse through them using the stacks." as string
		else
			set prValue to "You have the Dock showing hidden files. You can see the ones that are invisible and browse in them using the stacks." as string
		end if
	on error
		set prValue to "Current setting is unknown. The Dock will not show hidden files by default." as string
	end try
	display alert "Would you like to enable the use of browsing hidden files in the Dock?" message "This will show hidden files only in the Dock when enabled" & return & return & prValue buttons ["Cancel", "Enable", "Disable"] default button 3 cancel button 1
	if the button returned of the result is "Enable" then
		-- Show hidden files in Dock
		do shell script "defaults write com.apple.dock AppleShowAllFiles -boolean true"
		set bT to "You've decided to make the Dock show hidden files."
	else
		-- Don't highlight hidden files in the Dock (default setting)
		do shell script "defaults write com.apple.dock AppleShowAllFiles -boolean false"
		set bT to "You've decided to make the Dock show only the visible files."
	end if
	tell application "System Events"
		display alert "Dock - Changes Applied" message bT & " Your changes have been applied but have not yet taken effect. To see those changes you need to restart the Dock. Would you like to restart it now?" buttons ["Don't Restart", "Restart Dock"] cancel button 1 default button 2
	end tell
	do shell script "killall Dock"
end if