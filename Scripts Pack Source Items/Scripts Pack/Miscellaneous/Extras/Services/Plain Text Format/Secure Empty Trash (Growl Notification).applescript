# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

(*
Do not repetitivly activate this script using your hotkey set for this service
This will not work if run from the Automator
*)

set useR to do shell script "whoami"
set startTime to (current date)
tell application "Finder"
	set trashSize to (do shell script "du -h ~/.Trash | tail -rn1 | awk '{print \"\" $1}'")
	set noItems to (count (every item of the trash))
end tell
-- Empty started Growl notification
try
	tell application "System Events"
		set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0
	end tell
	
	set defaultIcns to (path to system folder as string) & "Library:CoreServices:Dock.app:Contents:Resources:trashfull.png" as alias
	
	if isRunning then
		
		tell application id "com.Growl.GrowlHelperApp"
			if noItems < "1" then
				notify with name Â
					"File Deletion - Complete" title Â
					"Secure Empty Trash - No Items" description Â
					"There are no items in the Trash to be erased at this time." application name "Scripts Pack" icon of file defaultIcns
			else
				notify with name Â
					"File Deletion - Started" title Â
					"Secure Empty Trash Started" description Â
					"The Trash will begin being securely emptied for " & useR & " which contains " & noItems & " items (" & trashSize & ")." application name "Scripts Pack" icon of file defaultIcns
			end if
		end tell
	end if
end try
-- [END] Empty started Growl notification

# You can change the amount of times it erases by modifying the flags in the command. Do not edit ~./Trash/* with ~ or somewhere where important files are or may be lost forever unless if backed up.
try
	do shell script "srm -rfvm ~/.Trash/*"
on error
	display alert "Secure Empty Trash - Expected Error" message "An error occured with this reminder script. You should investigate the problem. If the problem persists without any success you should stop using this script." as warning buttons ["OK"] cancel button 1 default button 1
end try

-- Empty complete Growl notification
try
	tell application "System Events"
		set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0
	end tell
	set defaultIcns to (path to system folder as string) & "Library:CoreServices:Dock.app:Contents:Resources:trashempty.png" as alias
	
	set EndTime to (get current date)
	set duration to EndTime - startTime
	
	set mins to duration div minutes
	set secs to duration mod minutes
	
	if isRunning then
		
		set CompSuccess to "Started: " & (startTime as text) & return & "Ended: " & (EndTime as text) & return & return & "It took " & TimeToText(EndTime - startTime)
		tell application id "com.Growl.GrowlHelperApp"
			if noItems > "0" then
				notify with name Â
					"File Deletion - Complete" title Â
					"Secure Empty Trash Completed" description Â
					CompSuccess & " to securely erase " & noItems & " item(s) with a total size of " & trashSize & "." application name "Scripts Pack" icon of file defaultIcns
			end if
		end tell
		
	end if
	-- [END] Empty complete Growl notification
end try
-- Slightly modified of http://macscripter.net/viewtopic.php?id=34653 - Timer
on TimeToText(TheTime)
	
	if (class of TheTime) as text is "integer" then
		set TimeString to 1000000 + 10000 * (TheTime mod days div hours)
		set TimeString to TimeString + 100 * (TheTime mod hours div minutes)
		set TimeString to (TimeString + (TheTime mod minutes)) as text
		tell TimeString to set TheTime to (text -6 thru -5) & " hour(s) " & (text -4 thru -3) & " minute(s) and " & (text -2 thru -1)
	end if
	return TheTime & " second(s)"
end TimeToText