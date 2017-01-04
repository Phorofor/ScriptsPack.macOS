# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Pause a process ID which is currently running.

set useR to do shell script "whoami"
set defaultHD to (path to system folder) as string
# set tIcon to defaultHD & "Library:CoreServices:CoreTypes.bundle:Contents:Resources:ToolbarAppsFolderIcon.icns"
(*
set tD to display dialog "Enter the Process ID (PID) of a process you wish to temporary stop. You can find the PID for an application that is running in the Activity Monitor. These numbers change every time an application is relaunched. If you want to pause a process which require admin authorisation choose 'Stop with Admin Privledges'." default answer "The process ID should be 1 - 4 digits long... (ex. 1047)" buttons ["Exit", "Stop Process", "Stop with Administrator Privledges"] cancel button 1 default button 2 with icon file tIcon with title "Stop Running Process"
*)

set tD to display dialog "Enter the Process ID (PID) of a process you wish to temporary stop. You can find the PID for an application that is running in the Activity Monitor. These numbers change every time an application is relaunched. If you want to pause a process which require admin authorisation choose 'Stop as Admin'." default answer "The process ID should be 1 - 4 digits long... (ex. 1047)" buttons ["Exit", "Stop Process", "Stop as Admin"] cancel button 1 default button 2 with icon 2 with title "Stop Running Process"

try
	
	set pSet to (text returned of tD) as number
on error
	set Fail to "You attempted to set the value as different characters other than numbers, but this feature only accepts numbers for it to work properly! Perhaps you should try again. The following characters will only work when used: 1234567890." as string
	display alert "An Expected Error Occured: Invalid Value!" message Fail as warning buttons {"OK"} cancel button 1 default button 1
end try
if the button returned of tD is "Stop Process" then
	try
		do shell script "kill -STOP " & pSet
	on error
		display alert "Expected Error!" as warning message "There was no process ID found with the PID of '" & pSet & "'. Each process ID should be at least 1 - 4 digits long, check to see the process ID you entered is correct or you tried to stop a process that wasn't started by the current user. Remember you can view a list of PIDs in the Activity Monitor for each application." buttons ["Open Activity Monitor", "OK"] cancel button 2 default button 2
		tell application "Activity Monitor" to run
	end try
else
	try
		do shell script "sudo kill -STOP " & pSet with administrator privileges
	on error
		display alert "Expected Error!" as warning message "Process failed to stop, you need administrator access in order to stop processes that are not owned by the current user. If you are trying to stop a process that is yours, you should use the 'Stop Process' button instead." buttons ["OK"] cancel button 1
	end try
	display alert "Success! - Process has been stopped." message "You've stopped the application with the PID of " & pSet & " successfully. The application may appear with the spinning rainbow cursor if there were any windows open for it, this is normal. Be sure to make sure that all your work is saved."
end if
end