(* You schedule a Time Machine backup using this script. If the backup disk isn't connected it will fail. This script give no prompt and start the backup and open the time machine preferences to show the progress.  You need to have Time Machine setup in order for this to work. *)

-- Versions compatible: 10.5 Leopard and later

do shell script "open /System/Library/PreferencePanes/TimeMachine.prefPane"
do shell script "/System/Library/CoreServices/backupd.bundle/Contents/Resources/backupd-helper &"