# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- If using Lion (10.7) or later it will disable Exposé instead.
-- Disables Exposé or Mission Control, you cannot access it when it's disabled

-- Disable Exposé (Mission Control in Lion and later)

-- Version compatible: 
-- Preference Identifier: com.apple.dock
-- Preference Key: mcx-expose-disabled
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (integer): NO

set MacVer to do shell script "sw_vers -productVersion"
set MacVer to "10.6.9"
set warN to "10.6.9"
if MacVer > warN then
	set noifIY to return & return & "[Operating System]: You appear to be running a version of Mac OS X (" & MacVer & ") that's higher than Snow Leopard. Prior to Lion, this script will disable or enable Mission Control instead."
	set noi1 to "Mission Control"
else
	set noifIY to ""
	set noi1 to "Exposé"
end if
try
	set prValue to do shell script "defaults read com.apple.dock mcx-expose-disabled -boolean"
	if prValue = "1" then
		set psValue to noi1 & " is currently disabled for this user. You won't be able to access it." & noifIY as string
	else
		set psValue to noi1 & " is currently enabled." & noifIY as string
	end if
on error
	set psValue to "The current setting is unknown. " & noi1 & " is enabled by default." & noifIY as string
end try
display alert "Would you like to disable or enable " & noi1 & "?" message "Disabling " & noi1 & " will prevent it from appearing. This can be useful if you find it annoying." & return & return & psValue buttons {"Cancel", "Enable", "Disable"} cancel button 1 default button 2
if the button returned of the result is "Disable" then
	-- Put show and hide animations back (default setting)
	do shell script "defaults write com.apple.dock mcx-expose-disabled -boolean YES"
	set bT to "You've decided to disable " & noi1 & "."
else
	do shell script "defaults write com.apple.dock mcx-expose-disabled -boolean NO"
	set bT to "You've decided to enable " & noi1 & "."
end if
tell application "System Events"
	display alert "Restart required for changes to take effect!" message bT & " To see the changes you need to restart the Dock. Would you like to restart it now?" buttons {"Don't restart", "Restart Dock"} cancel button 1
end tell
do shell script "killall Dock"
end