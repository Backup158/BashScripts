# Script Details
Hello future me (and any weary travelers)! Here's a bunch of amateurly-written scripts. Used on Linux Mint. All of the folder locations are hard coded :D
## Startup
Executed at startup through crontab. Creates separate audio sinks to split tracks for OBS recording.

## Backup
Creates a .bak of all arguments. Dumps them in current working directory.

## New Script
Initializes a new script in my Scripts folder, makes it executable, and adds an entry to `~/.bash_aliases` for ease of use. Then opens in Xed text editor to quickly edit it. I heard you like scripts, so I made a script to automate your scripts.

## 7z
Downloaded the [7z 64-bit Linux x86-64 precompiled... thing idk](https://www.7-zip.org/download.html) and put it in `/usr/7z/`. Is this bad practice? Idk I should figure that out. I didn't want to have to wait for the p7zip dev to update, so I use this primitive script for my most common use case.

## Remove Old Linux Kernels
Calls the autopurge for kernels older than (current - 1). Needs sudo. Really should just be an alias but I like seeing what was installed.

## Darktide Launcher
Requires the [Darktide Launcher Skip](https://github.com/ronvoluted/darktide-launcher-skip) to be installed according to the instructions on that repository. 

## Darktide Clear PowerDI
The Darktide [Power DI Mod](https://www.nexusmods.com/warhammer40kdarktide/mods/281) stores its settings in the game's AppData folder, and these can get quite bloated over time. Only this mod (so far) uses the .old and .sav files, so just trash them all. I've cleared out like 3 GB of saved game histories lol. Needs sudo.

# Resources Referenced
- https://stackoverflow.com/questions/13872048/bash-script-what-does-bin-bash-mean
- https://linuxhandbook.com/bash/
- https://linuxize.com/post/chmod-command-in-linux/
- https://stackoverflow.com/questions/17701989/how-do-i-append-text-to-a-file
- https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Aliases    for using sudo and aliases
