# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Set the workspaces delay when dragging a window to the edge of the screen

-- Set Workspaces Window Edge Delay
-- Versions compatible: 
-- Preference Identifier: com.apple.dock
-- Preference Key: workspaces-edge-delay
-- Preference location: ~/Library/Preferences/com.apple.dock
-- Default value (float): -- 

try
	set pValue to do shell script "defaults read com.apple.dock workspaces-edge-delay -float"
	set prValue to "The current set drag window spaces delay is: " & pValue & "."
on error
	set prValue to "The current set value for the workspaces delay is unknown."
end try
set defaultHD to (path to system folder) as string
set tIcon to defaultHD & "Library:CoreServices:Dock.app:Contents:Resources:Dock.icns"
display dialog "Enter a number to set the delay when dragging a window to the edge of the screen. The Dock will automatically be restarted." & return & return & prValue default answer "Enter a number set delay, you can enter decimals" buttons ["Cancel", "Set Workspaces Delay to Entered Value"] default button 2 cancel button 1 with title "Set Workspaces Window Edge Delay" with icon file tIcon
try
	set pSet to (text returned of result) as number
on error
	set Fail to "You attempted to set the value as different characters other than numbers, but this feature only accepts numbers for it to work properly! Perhaps you should try again. The following characters will only work when used: 1234567890" as string
	display alert "An Expected Error Occured: Invalid Value!" message Fail as warning buttons {"OK"} cancel button 1 default button 1
end try
do shell script "defaults write com.apple.dock workspaces-edge-delay -float " & pSet
do shell script "killall Dock"