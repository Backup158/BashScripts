#!/bin/bash

cd '/media/gamedisk/SteamLibrary/steamapps/compatdata/1361210/pfx/drive_c/users/steamuser/AppData/Roaming/Fatshark/Darktide'
# lists all files in directory
#	piped to grep to find all files that end in old
#	-c displays count
ls -A | grep -c old$
trash *.old
trash *.sav
echo Trashed that many Power DI reports!
