# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>


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