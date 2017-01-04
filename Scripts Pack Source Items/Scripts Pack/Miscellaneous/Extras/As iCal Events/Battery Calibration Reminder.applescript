vv

(*

Battery Calibration Reminder
For use with portable Macs, Apple recommends that you should calibrate the battery once a month, you can read more here: http://support.apple.com/kb/HT1490

You can set this as an iCal Reminder in the iCal application and set it so that it runs this script once a month to remind you to calibrate your battery.

*)

set defaultHD to (get path to system folder) as string
set mcIcon to defaultHD & "Library:PreferencePanes:EnergySaver.prefPane:Contents:Resources:EnergySaver.icns"

display dialog "You should calibrate your MacBook battery. Leave it fully charged for 2 hours then unplug the power adadpter then continue to use the computer. Save your work once it has started to run on reserve battery power. Once the battery has drained, you should leave the computer for 5 hours or more without power then charge it again. Click 'More Information' for the full details, tips and recommendations by Apple." buttons ["More Information", "Energy Saver Preferences…", "OK"] cancel button 3 default button 3 with icon file mcIcon with title "Calibrate Your Battery"

if the button returned of the result is "More Information" then
	do shell script "open http://support.apple.com/kb/HT1490"
else
	do shell script "open /System/Library/PreferencePanes/EnergySaver.prefPane"
end if