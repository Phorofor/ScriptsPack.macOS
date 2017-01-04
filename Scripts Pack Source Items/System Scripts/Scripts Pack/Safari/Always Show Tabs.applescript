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

-- Shows the tab bar even when there's less than two tabs open in a single window.

-- Versions compatible:
-- Preference Identifier: com.apple.Safari
-- Preference Key: AlwaysShowTabBar
-- Preference location: ~/Library/Preferences/com.apple.Safari.plist
-- Default value: NO

set appD to "Safari"
set toggleBut to "Always Show"
set tZ to "always show the tab bar?"
set sTz to "YES"
set bT to "You've decided that " & appD & " should always show the tab bar."
try
	set prValue to do shell script "defaults read com.apple.Safari AlwaysShowTabBar"
	if prValue = "-1" then
		set prValue to "The Safari's tab bar is set to be always shown. It will not hide when there's less than two tabs in a single window."
		set toggleBut to "Hide"
		set tZ to "hide the tab bar when there's less than two tabs open in a single window?"
		set sTz to "NO"
		set bT to "You've decided to hide the tab bar when there's less than two tabs open in a single window."
	else
		set prValue to "The Safari's tab bar will always be hidden when there's less than two tabs open in a single window."
	end if
on error
	set prValue to "The Safari's tab bar is hidden when there's less than two tabs in a single window open by default"
end try
display alert "Would you like to " & tZ message "If the tab bar is always shown, it will be shown even if there's less than two tabs open in a single window." & return & return & prValue buttons ["Cancel", "Clear", toggleBut] default button 3 cancel button 1
if the button returned of the result is toggleBut then
	do shell script "defaults write com.apple.Safari AlwaysShowTabBar -bool " & sTz
	
else
	do shell script "defaults delete com.apple.Safari AlwaysShowTabBar"
	set bT to "You've decided to clear the preference."
end if
tell application "System Events" to (name of every process)
if the result contains appD then
	tell application appD
		display alert "Quit " & appD & " to see changes" message bT & " To see the changes you've made, you need quit " & appD & ". Would you like to do that now? You'll have to open " & appD & " manually." buttons {"Restart Later", "Quit " & appD} default button 2 cancel button 1
		tell application appD to quit
	end tell
else
	display alert appD & " - Changes Applied!" message bT & " Your changes will take effect the next time you open " & appD & "." buttons ["Cancel", "Open " & appD] cancel button 1
	tell application appD to run
end if