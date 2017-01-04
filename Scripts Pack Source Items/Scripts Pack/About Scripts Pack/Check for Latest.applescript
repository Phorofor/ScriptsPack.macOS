# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

display dialog "Kind of useless script. Still needs actual fixing, just a placeholder item for now." buttons ["Cancel", "Okay."] cancel button 1 default button 1

set defaultHD to (get path to system folder) as string
set mcIcon to defaultHD & "Library:CoreServices:Software Update.app:Contents:Resources:Software Update.icns"
set upD to POSIX path of ((path to me) & "Scripts Pack - Check Updates" as string)
set upDR to quoted form of upD

display alert "Check for Scripts Pack Latest Version" message "If you'd like to check to see if you have the latest version of the Scripts Pack, use the button below." buttons ["Cancel", "Phorofor on GitHub", "Check for Latest"] cancel button 1 default button 3
if the button returned of the result is "Check for Latest" then
	display dialog "The Scripts Pack Latest Version page will open in your default internet browser. Is this OK?" buttons ["Nope", "Yes"] default button 2 cancel button 1 with title "Scripts Pack - Latest" with icon 2
	try
		do shell script "--"
		
	on error
		display alert "Error Occured: File Unavailable!" as warning message "The update file was unable to be found. You may have modified the Scripts Pack or you aren't using a genuine copy of it from the original source. Please re-install the Scripts Pack if the problem persists. If that doesn't work, you may have installed a copy of the Scripts Pack that is not genuine."
	end try
else
	do shell script "open http://github.com/Phorofor/ScriptsPack.macOS"
end if