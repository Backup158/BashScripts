#!/bin/bash
# Creates a symlink from the mod development folder to the Darktide mods folder. Argument is the path to the mod folder in the repo directory.

# If no arguments given, get it. If too many, exit
if [ "$#" -eq 0 ]; then
    read -p "Enter path to the mod folder within the repository base directory. Even if there are spaces, do NOT wrap in quotation marks. Path:" repoBase
else 
    if [ "$#" -eq 1 ]; then
        repoBase=$1
    else
        echo "Improper argument count! Rerun the script and pass the path to the mod folder within the repository base directory."
        exit 1
    fi
fi

# the ## finds the longest matching expansion of the prefix pattern, so it finds all the folders before the final /
modName="${repoBase##*/}"
darktideModsDirectory="/mnt/data/SteamLibrary/steamapps/common/Warhammer 40,000 DARKTIDE/mods"
ln -s "${repoBase}" "${darktideModsDirectory}/${modName}"

