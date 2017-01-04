# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

set MacVer to do shell script "sw_vers -productVersion"

set Sdescription to "Skips the verifying when opening disk images to save some time, but can also be a dangerous action to skip the verification process." as string

-- Skip Disk Image Verify
-- Versions compatible: Panther (10.3)+
-- Preference: com.apple.frameworks.diskimages
-- Preference Key: skip-verify
-- Preference location: ~/Library/Preferences/com.apple.frameworks.diskimages.plist
-- Default value (string): false

set useR to do shell script "whoami"
set MacVer to do shell script "sw_vers -productVersion"
set Min to "10.3.0" as string
if MacVer < Min then
	display alert "Outdated Mac OS Version!" message "You're using Mac OS " & MacVer & ". This feature isn't supported for that. Come back when you've updated to Panther (10.3) or higher. Then this feature will work." buttons ["OK"] as warning cancel button 1
else
	try
		set prValue to do shell script "defaults read com.apple.frameworks.diskimages skip-verify"
		
		set toggleBut to "Skip Verify"
		set tZ to "skip"
		set sTz to "true"
		
		if prValue = "true" then
			
			set toggleBut to "Enable Verify"
			set tZ to "enable"
			set sTz to "false"
			
			set psValue to "[ ! WARNING ! ]: You appear to have the disk image checksum verify feature turned off. This can be a risky setting, so it's best to use trusted sources so you don't get some malicious attacks or anything. Enable the verify feature to turn it back on."
		else
			set psValue to "The disk image verify feature is turned on. It's best to leave it that way. Skipping it saves more time but can also be risky."
		end if
	on error
		set psValue to "The verify disk image feature is turned on as its default setting. Don't change this unless you're sure about what you're doing."
	end try
	
	set tD to display alert "Would you like to " & tZ & " the checksum verify when opening disk images?" message Sdescription & return & return & psValue buttons ["Cancel", "Clear", toggleBut] cancel button 1
	
	if the button returned of tD is "Skip Verify" then
		
		display alert "Stop right there, " & useR & "!" message "You're about to skip the disk image checksum verify. This can be the most dangerous action, if a giant monster comes and messes up something on this computer while the verify is disabled - that's " & useR & "'s fault, not mine! Are you willing to stay back or going to take the risk?" as warning buttons ["Stay Back", "Proceed with Caution"] cancel button 1 default button 1
		
		set pSet to "The verify feature is now disabled! The disk images will not verify itself automatically anymore so you can save yourself some time! Remember that you set this setting at your own risk. You can change this setting if you're afraid that something is gonna come and mess your computer!"
		do shell script "defaults write com.apple.frameworks.diskimages skip-verify true"
	end if
	if the button returned of tD is "Enable Verify" then
		do shell script "defaults write com.apple.frameworks.diskimages skip-verify false"
		set pSet to "The disk images will now verify its checksums when being mounted. You're now a bit safer away from those things."
	end if
	if the button returned of tD is "Clear" then
		do shell script "defaults delete com.apple.frameworks.diskimages skip-verify"
		set pSet to "You've cleared the preference for disk image verifying."
	end if
	display alert "Disk Image Verify - Changes Applied" message pSet
end if