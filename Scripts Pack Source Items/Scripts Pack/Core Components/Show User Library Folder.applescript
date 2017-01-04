# Scripts Pack - Tweak various preference variables in macOS
# <Phorofor, https://github.com/Phorofor/>

-- Shows user library folder if enabled (~/Library) without needing to manually enter the location of the folder. Is hidden in Lion by default, there's no need to use this script in Snow Leopard unless you want to hide the folder instead. It also applies to third-party applications that is a file browser.

-- Show the current user's Library folder

set currentUser to do shell script "whoami"
display alert "Would you like to show or hide the user Library folder (~/Library)?" message "By default in Lion, the user Library folder is hidden you can hide or show it with this script. It also affects third-party file browsers." & return & return & "Full Library path for current user: /Users/" & currentUser & "/Library/" buttons {"Cancel", "Show", "Hide"} default button 3 cancel button 1
if the button returned of the result is 2 then
	-- Show the current user's library folder (default in Snow Leopard)
	do shell script "chflags nohidden ~/Library"
else
	-- Hide the current user's library folder (default in Lion)
	do shell script "chflags hidden ~/Library"
end if
display dialog "Your changes have been applied." with icon note buttons {"OK"} default button 1