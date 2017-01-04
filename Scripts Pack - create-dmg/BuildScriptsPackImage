#!/bin/sh
# Disk Image Build Script for Scripts Pack
# Scripts Pack for macOS is maintained by 
# <Phorofor, https://github.io/Phorofor>
# Licensed under the BSD-2-Clause license.

# This script makes use of create-dmg by <https://github.com/andreyvit>
# create-dmg is Copyright (c) 2008-2014 Andrey Tarantsov and is 
# licensed under The MIT License.

# Timestamp for build versions is in the format:
# 1YYYYMMDD.HHMMSS where the date and time is in UTC timezone


BUILDTIMESTAMP="1$(date -u +%Y%m%d).$(date -u +%H%M%S)"
BUILDTIMEHUMANREADABLE="$(date -u +%Y-%m-%d\ %H.%M.%S)" 
BUILDNAME="Scripts Pack - $BUILDTIMEHUMANREADABLE.dmg"
FOLDERTEXT="R$BUILDTIMEHUMANREADABLE"

cd "$(dirname "$0")"
echo "$BUILDTIMESTAMP" > "../Scripts Pack Source Items/Scripts Pack/About Scripts Pack/.ScriptsVersion.txt"
echo "$BUILDTIMEHUMANREADABLE" > "../Scripts Pack Source Items/Scripts Pack/About Scripts Pack/.ScriptsVersionBuild.txt"
cp -R ReleaseTemplateIcon "../Scripts Pack Source Items/$FOLDERTEXT"
ln -s "/Library/Scripts" "../Scripts Pack Source Items/System Scripts"
ln -s "/Volumes/Scripts Pack/Scripts Pack/About Scripts Pack/Information.scptd/Information" "../Scripts Pack Source Items/Information"
# --eula "../Scripts Pack Source Items/Information/LICENSE"

./create-dmg \
--volname "Scripts Pack" \
--background SPBackgroundImage.tiff \
--window-pos 200 120 \
--window-size 800 400 \
--icon-size 64 \
--text-size 12 \
--icon "Information" 474 261 \
--icon "Install.applescript" 611 261 \
--icon "Scripts Pack" 314 261 \
--icon "$FOLDERTEXT" 217 285 \
--icon "System Scripts" 208 147 \
"../Builds/$BUILDNAME" \
"../Scripts Pack Source Items"/ && rm -R "../Scripts Pack Source Items/$FOLDERTEXT" && rm -R "../Scripts Pack Source Items/System Scripts" && rm -R "../Scripts Pack Source Items/Information"