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

(* Switch User Script. Save as a Service in Automator and run it with a key combo shortcut. *)

-- You may wish to copy the entire thing for it to work.
tell application "Finder"
	set defaultHD to (get name of startup disk) as string
end tell
set rIcon to defaultHD & ":System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:Accounts.icns"
set useRi to do shell script "whoami"
display dialog "Switching user " & useRi & "..." & return & "Your action should process shortly…" default answer "Press 'Return' to switch now." giving up after 1 with icon file rIcon with title "Switch User - " & useRi
do shell script ("/System/Library/CoreServices/Menu' 'Extras/User.menu/Contents/Resources/CGSession -suspend")
end