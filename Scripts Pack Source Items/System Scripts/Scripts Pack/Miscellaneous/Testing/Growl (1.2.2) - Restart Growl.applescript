# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- End/Load All Growl Related Processes

-- This script kills/starts all Growl related processes. This may be not useful if you use the menu bar method where Growl is in its default location.

set GrowlHelp to "com.Growl.GrowlHelperApp"
set HWGrowl to "com.Growl.HardwareGrowler"
set GSafari to "com.growl.GrowlSafariLoader"
set GTunes to "com.Growl.GrowlTunes"


tell application "System Events"
	set GrowlHelpRun to (count of (every process whose bundle identifier is GrowlHelp)) > 0
	set HWGrowlRun to (count of (every process whose bundle identifier is HWGrowl)) > 0
	set GSafariRun to (count of (every process whose bundle identifier is GSafari)) > 0
end tell

if GrowlHelpRun then tell application id GrowlHelp to reopen
