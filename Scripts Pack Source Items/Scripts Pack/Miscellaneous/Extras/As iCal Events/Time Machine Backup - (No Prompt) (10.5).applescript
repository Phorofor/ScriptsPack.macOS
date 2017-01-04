(* You can schedule a Time Machine backup using this script. If the backup disk isn't connected it will fail. This script will not give any prompts or notifications.  You need to have Time Machine setup in order for this to work. *)

-- Versions compatible: 10.5 Leopard and later

do shell script "/System/Library/CoreServices/backupd.bundle/Contents/Resources/backupd-helper &"