#Scripts Pack

A project that I got too lazy to continue based upon users being restricted by an organisation (such as a school) through some sort of Network Account Server and the only possible way was to perform shell tasks integrated into AppleScripts to perform tasks that tweaks variables in a user's preferences.

[Visit the Scripts Pack GitHub Pages site](https://phorofor.github.io/ScriptsPack.macOS/)

## Installing
**0.** Just run the Scripts Pack's ``Install.applescript``. If you don't feel like using that script, drag the ``Scripts Pack`` folder into ``~/Library/Scripts`` for the current user, or ``/Library/Scripts`` for all users. See [the Manual Installation page] for more details.

## Building
You don't need to build anything. In fact, it'll work just by dragging the Scripts Pack folder anywhere. For fun, you can Scripts Pack's create-dmg script. Just run ``./BuildScriptsPackImage`` when in the same directory as the create-dmg folder and ensure you have Xcode and its command-line tools installed. Its output should be placed in the ``Build`` folder.

## License
Scripts Pack is licensed under the BSD License. See the [``License``](https://github.com/Phorofor/ScriptsPack.macOS/blob/master/License) file for more information.

Scripts Pack also makes use of [create-dmg](https://github.com/Phorofor/create-dmg) which is licensed under the [MIT License](https://github.com/andreyvit/create-dmg/blob/master/LICENSE) to generate disk images for this program.