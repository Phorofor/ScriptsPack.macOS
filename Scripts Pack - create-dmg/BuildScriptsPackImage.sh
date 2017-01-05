#!/bin/sh
echo "#################################################"
echo "# Disk Image Build Script for Scripts Pack      #"
echo "# Scripts Pack for macOS is maintained by       #" 
echo "# <Phorofor, https://github.io/Phorofor>        #"
echo "# Licensed under the BSD-2-Clause license.      #"
echo "#################################################"
echo "# This script makes use of create-dmg by        #"
echo "# <https://github.com/andreyvit> which is       #"
echo "# Copyright (c) 2008-2014 Andrey Tarantsov      #" 
echo "# and is licensed under The MIT License.        #"
echo "#################################################"
# Timestamp for build versions is in the format:
# 1YYYYMMDD.HHMMSS where the date and time is in UTC timezone

#--icon "$FOLDERTEXT" 217 285 \
#&& rm -R "../Scripts Pack Source Items/$FOLDERTEXT"

BUILDTIMESTAMP="1$(date -u +%Y%m%d).$(date -u +%H%M%S)"
BUILDTIMEHUMANREADABLE="$(date -u +%Y-%m-%d\ %H.%M.%S)" 
#BUILDNAME="Scripts Pack - $BUILDTIMEHUMANREADABLE.dmg"
BUILDNAME="Scripts Pack.dmg"
FOLDERTEXT="R$BUILDTIMEHUMANREADABLE"
echo "[$(date -u +%H:%M:%S)]: The build time stamp for this: $BUILDTIMEHUMANREADABLE (in UTC) and will be identified as: $BUILDTIMESTAMP"

cd "$(dirname "$0")"
# Do a cleanup if these exist
echo "[$(date -u +%H:%M:%S)]: Doing a cleanup of existing symbolic links..."
rm -R "../Scripts Pack Source Items/System Scripts"
rm -R "../Scripts Pack Source Items/Information"

echo "Placing build time stamps into .ScriptsVersion and .ScriptsVersionBuild..."
echo "$BUILDTIMESTAMP" > "../Scripts Pack Source Items/Scripts Pack/About Scripts Pack/.ScriptsVersion.txt"
echo "$BUILDTIMEHUMANREADABLE" > "../Scripts Pack Source Items/Scripts Pack/About Scripts Pack/.ScriptsVersionBuild.txt"
#cp -R ReleaseTemplateIcon "../Scripts Pack Source Items/$FOLDERTEXT"
echo "[$(date -u +%H:%M:%S)]: Generating symbolic links for the System Scripts and Information directory..."
ln -s "/Library/Scripts" "../Scripts Pack Source Items/System Scripts"
ln -s "/Volumes/Scripts Pack/Scripts Pack/About Scripts Pack/Information.scptd/Information" "../Scripts Pack Source Items/Information"
echo "[$(date -u +%H:%M:%S)]: Symbolic links created!"

echo "[$(date -u +%H:%M:%S)]: Starting create-dmg..."
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
--icon "System Scripts" 208 147 \
"../Builds/$BUILDNAME" \
"../Scripts Pack Source Items"/ && rm -R "../Scripts Pack Source Items/System Scripts" && rm -R "../Scripts Pack Source Items/Information"
echo "[$(date -u)]: End of Build Scripts Pack Image script! We should be done here."