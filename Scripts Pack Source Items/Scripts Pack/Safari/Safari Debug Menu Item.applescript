# Scripts Pack - Tweak various preference variables in macOS
# Copyright (C) 2016 <Phorofor, https://github.com/Phorofor/>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- Show Debug Menu in Safari
-- Preference Identifier: com.apple.Safari
-- Preference Key: IncludeDebugMenu
-- Preference location: ~/Library/Preferences/com.apple.Safari.plist
-- Default value: NO

set appD to "Safari"
set toggleBut to "Show Debug Menu"
set tZ to "show"
set sTz to "1"
set bT to "You've decided that " & appD & " should show the debug menu item"
try
	set prValue to do shell script "defaults read com.apple.Safari IncludeDebugMenu"
	if prValue = "1" then
		set prValue to "The " & appD & " debug menu is now shown."
		set toggleBut to "Hide Debug Menu"
		set tZ to "hide"
		set sTz to "0"
		set bT to "You've decided to disable the screenshot shadows, you will no longer see them when you take screenshots."
	else
		set prValue to "The " & appD & " debug menu item is hidden. You will not be able to access it when it's running."
	end if
on error
	set prValue to "The " & appD & " debug menu item is hidden by default."
end try
display alert "Would you like to " & tZ & " the " & appD & " debug menu?" message "Shows a debug menu in the menubar when running " & appD & ". It gives access to some features." & return & return & prValue buttons ["Cancel", "Clear", toggleBut] default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.Safari IncludeDebugMenu " & sTz
else
	do shell script "defaults remove com.apple.Safari IncludeDebugMenu"
	set bT to "You've decided to clear the preference for the Safari debug option."
end if
tell application "System Events" to (name of every process)
if the result contains appD then
	tell application appD
		display alert "Quit " & appD & " to see changes" message bT & ". To see the changes you've made, you need quit " & appD & ". Would you like to do that now? You'll have to open " & appD & " manually." buttons {"Restart Later", "Quit " & appD} default button 2 cancel button 1
		tell application appD to quit
	end tell
else
	display alert appD & " - Changes Applied!" message bT & ". Your changes will take effect the next time you open " & appD buttons ["Cancel", "Open " & appD] cancel button 1
	tell application appD to run
end if