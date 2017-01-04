# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Launch Java .jar File without Apple's Jar Launcher


tell application "Finder"
	set defaultHD to (get name of startup disk) as string
end tell
set javaIcon to defaultHD & ":System:Library:CoreServices:Jar Launcher.app:Contents:Resources:JarLauncher.icns"

set useR to do shell script "whoami"

try
	set pValue to do shell script "defaults read com.Phorofor.ScriptsPack JarLaunch"
	set pRe to "Last previous .jar file location launched: " & pValue as string
on error
	set pRe to "No previous .jar has been launched with this script for " & useR & ". You'll need to launch one with this script in order for the previous launch function to work."
end try
(* try
	set rValue to do shell script "'defaults read /Library/Managed Preferences/'" & useR & "com.apple.applicationaccess.new"
on error
	set rValue to "[ ]" as string
end try *)
display dialog "Would you like to launch a Java .jar file?" & return & return & pRe buttons ["Cancel", "Launch Previous .jar", "Launch Other..."] default button 3 cancel button 1 with title "Launch Java .jar File" with icon file javaIcon
if the button returned of the result is "Launch Previous .jar" then
	try
		set prefReal to quoted form of the POSIX path of pValue
		do shell script "java -jar " & prefReal
	on error
		display alert "An Expected Error Occured: Unable to launch previous .jar file!" as warning message "The previous .jar file may have been dragged to a different location or is unreadable. If you're using this script for the first time, use the 'Launch Other…' action then the previous .jar function will become available."
	end try
else
	-- Sets selected file as string
	set jarFile to (choose file with prompt "Please select a .jar file you wish to launch.") as string
	-- Converts jarFile to a POISX path in order to work with do shell script
	set jarApp to POSIX path of jarFile
	set jarFinal to quoted form of the POSIX path of jarApp
	try
		-- Launches the specified jar file with the location string as a POISX path
		do shell script "java -jar " & jarFinal
		try
			do shell script "defaults write com.Phorofor.ScriptsPack JarLaunch " & jarFinal
		on error
			display alert "An Expected Error Occured: Preference Unavailable" as warning message "Unable to write your previous .jar settings. You may not have the permissions to write to the file. The Launch Previous .jar action may not work properly."
		end try
	on error
		display alert "An Expected Error Occured: Invalid File or Java isn't available" as warning message "The selected file failed to launch, this may be because…" & return & return & "- Java is not installed on this computer" & return & "- You chose a file with a different extension" & return & "- The .jar file is damaged or isn't a Java applet" & return & "- Your account (" & useR & ") doesn't have any permission to use Java on this computer" & return & "- The current version of Java on this computer is out of date"
	end try
end if