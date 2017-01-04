# Changes in the Scripts Pack

## Latest
Kind of left this since I no longer use macOS for now. I've retested this to ensure that these scripts will at least run (some features may have been removed in recent macOS versions so some scripts won't be effective). Nonetheless, it has not been forgotten and is now available on [this GitHub respository](https://github.com/Phorofor/ScriptsPack.macOS). Here's a list of changes since the first iteration of the Scripts Pack:

- The copyright information is now updated to feature the year range from 2012 to 2017 to stay relevant.

- The disk image for the Scripts Pack now contains a symbolic link to the System Scripts folder and the Information folder.

- Replaced Lion dialog disk image background and is updated to represent modern versions of macOS and also contains a HiDPI variant for retina resolution.

- Build version is now represented by the time and date in UTC (in the format 1YYYYMMDD.HHMMSS).

- Thanks to Andrey Tarantsov's [https://github.com/andreyvit/create-dmg](https://github.com/andreyvit/create-dmg), the Scripts Pack Disk Image can be built with automatic version information being placed (in UTC).

- Stopped version handling on some scripts where features still are tested to work - 10.10 is basically identified as "10.1" which is less than "10.9". Version checking remains on scripts that have features that are guaranteed to no longer work on anything higher than 10.9.

- Now licensed under the [BSD-2-Clause license](https://opensource.org/licenses/BSD-2-Clause)

- Removed Growl scripts as they were imported from a corrupted backup. The dialog to Register with Growl Support has also been removed as it points to the corrupted script.

- Removed some other template scripts as they were imported from a corrupted backup.

- Refined the Installer script - It is no longer dependant on the location of the Scripts Pack volume and with the Users directory being at /Users. There is less dialog prompts involved and defaults as an "Uninstaller" when it detects .ScriptsVersion at the default location. The 'splash screen' has been removed as it is an outdated image.

- Stopped using ``tell application "Dock"`` as it doesn't want to work in later macOS versions and is replaced with telling "System Events" instead. No Dock icon will appear in the dialog, though.

- Most scripts are now in ``.applescript`` plain text format for better previewing and to use the least amount of space possible.

- Everything else pretty much remains the same as it was.

### 17/07/2012 (v0.0.01) - Test Release
Scripts Pack has arrived. Preferences checkers, version checkers and some more! All purely script-based. All open-source. No applications. No need to execute any other application binary when opening these scripts. Expect bugs or mistakes and lack of all of the hidden features because it's a bit of a pain to work with some of these scripts and building them.

- Initial Test Release

**Features need to be added/improved:**
- Make it easier and quicker to access
- List mode to be able to view scripts in one single applescript (probably won't happen)
- Add a window title with custom icons with the 'display alert' function (might not be possible)
