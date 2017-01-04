# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

# Dynamic Version check thing based upon .ScriptsVersion.txt
try
	set VersionPath to POSIX path of ((path to me as string) & "::.ScriptsVersion.txt")
	set VersionQuoted to quoted form of VersionPath
	set ResourceVersion to (do shell script "cat " & VersionQuoted as quoted form) as string
on error
	set ResourceVersion to ".ScriptsVersion.txt undetected/unreadable"
end try

try
	set ResourcePathBuild to POSIX path of ((path to me as string) & "::.ScriptsVersionBuild.txt")
	set ResourceReferenceQuotedBuild to quoted form of ResourcePathBuild
	set ResourceVersionBuild to (do shell script "cat " & ResourceReferenceQuotedBuild as quoted form) as string
on error
	set ResourceVersionBuild to return & ".ScriptsVersionBuild.txt undetected/unreadable"
end try

set crediZ to POSIX path of ((path to me) & "::Information.scptd:Information" as string)
set crediZRel to quoted form of crediZ

set pageAb to "1"


set about1 to "Release: " & ResourceVersion & " (" & ResourceVersionBuild & ")" & return & "https://github.com/Phorofor/ScriptsPack.macOS"
set about1x1 to "Copyright (c) 2012 - 2017, Phorofor" & return & "<https://github.io/Phorofor>" & return & "Licensed under the 2-Clause BSD License"
set about1x2 to "The Scripts Pack was created specifically for restricted users running macOS 10.4 and later. See the Information for more details."

display alert "About Scripts Pack for macOS" message about1 & return & return & about1x1 & return & return & about1x2 & return buttons ["GitHub", "Information", "Exit"] default button 3 cancel button 3
if the button returned of the result is "Information" then
	try
		do shell script "open " & crediZRel
		error number -128
		#on error
		
		display alert "An Expected Error Occured: File Unavailable!" as warning message "The Credits file was unable to be found. You may have modified the Scripts Pack or you aren't using a genuine copy of it from the original source. Please re-install the Scripts Pack if the problem persists. If that doesn't work, you may have installed a copy of the Scripts Pack that is not genuine."
	end try
else
	do shell script "open https://github.com/Phorofor/ScriptsPack.macOS"
end if


end