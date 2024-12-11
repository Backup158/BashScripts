#!/bin/bash

cd '/media/gamedisk/SteamLibrary/steamapps/common/Warhammer 40,000 DARKTIDE/launcher'
mv Launcher.exe Launcher_o.exe
cp LauncherSkip.exe Launcher.exe
echo Patched!
