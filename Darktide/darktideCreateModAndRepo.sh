#!/bin/bash
# Creates Darktide mod in the mod page folder, then links it to the Darktide game folder
# If no arguments given, print instructions and back tf out
if [ "$#" -eq 0 ]
then
    echo "No arguments given! Rerun the script and pass the mod names as arguments, which each mod separated by a space."
    exit 1
fi
# If you have reached this point, there were indeed arguments given
# If there are multiple, confirm if there are no spaces
if [ "$#" -gt 1 ]
then
    echo "Warning! Mods cannot have spaces in their names (for this script). You are about to create $# mods; is this intentional? If not, rerun the script and try again."
    echo -e "\tY for Yes\n\tN for No\n\tAll other inputs will count as No!"
    echo -e "\nCreate $# mods?\nY/N"
    read ans
    case "$ans" in
    [yY]* ) ;;
    *) exit 1;;
    esac
fi

# Goes to the mod development folder
modDevFolder="/mnt/data/Projects/Modding/Darktide Stuffs/Mod Page Information and Development/"
cd "${modDevFolder}"
# Creates a mod for each argument
for arg in "$@"
do
    # Make the repo folder
    repoFolderName="${arg}/Darktide${arg}/"
    mkdir -p "${repoFolderName}"
    # Move into the repo folder and make the mod
    cd "${repoFolderName}"
    ~/Scripts/darktideNewMod.sh ${arg}
    # Links repo to the game
    repoBase="${modDevFolder}/${repoFolderName}/${arg}"
    ~/Scripts/darktideLinkRepoToGame.sh "${repoBase}"
done
