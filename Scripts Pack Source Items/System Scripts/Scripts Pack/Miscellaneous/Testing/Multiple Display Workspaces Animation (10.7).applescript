# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- Turns off workspaces swoosh animation

-- Disable Multiple Monitors Workspaces Animation
-- information may not be accurate

-- Versions compatible: --
-- Preference Identifier: com.apple.dock
-- Preference Key: workspaces-swoosh-animation-off
-- Preference location: ~/Library/Preferences/com.apple.dock.plist
-- Default value (boolean): NO

display alert "Would you like to turn off the workspaces swipe animation?" message "Turns off swipe animation for other monitors except the main one." buttons {"Cancel", "On", "Off"} default button 2 cancel button 1
if the button returned of the result is "Off" then
	-- Turn off animation
	do shell script "defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES"
else
	do shell script "defaults write com.apple.dock workspaces-swoosh-animation-off -bool NO"
end if
display alert "The Dock needs to be restarted for the changes to take effect, restart now?" buttons {"Cancel", "Restart"} cancel button 1
do shell script "killall Dock"
delay 2
tell application "Dock"
	display alert "The Dock has been restarted, your changes should have taken effect."
end tell