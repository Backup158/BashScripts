# Script Details
Hello future me (and any weary travelers)! Here's a bunch of amateurly-written scripts. Used on Linux Mint. All of the folder locations are hard coded :D 

I keep all of these in a folder `~/Scripts` , which I've added to my PATH.
## Startup
Creates separate audio sinks to split tracks for OBS recording. See my [startup process](https://github.com/Backup158/StartupProcess/blob/main/README.md#obs-sinks) for further details.

> [!WARNING]
> Audio device IDs are hard coded.

> [!NOTE]
> Executed at startup through crontab. 

## Backup
Creates a `.bak` for each argument. Dumps them in current working directory.

## New Script
Initializes a new script in `~/Scripts` folder, makes it executable, and adds an entry to `~/.bash_aliases` for ease of use. Then opens in Xed text editor to quickly edit it. 

I heard you like scripts, so I made a script to automate your scripts.

## Install Font
Assumes you have downloaded fonts to the current working directory. Pass the archive names to the script and it will unzip the fonts to the shared user location (creating a folder for each font).

## Convert and Delete webp files
Converts all webp files to png then deletes them. Does NOT contain checks for if the conversion fails; use with caution!

## Find A without B
Chaining grep to find all instances of given string A without instances of B. Recursively searches for all files in current working directory.

# Gaming-related Scripts

## Darktide Launcher
Requires the [Darktide Launcher Skip](https://github.com/ronvoluted/darktide-launcher-skip) to be installed according to the instructions on that repository. 

> [!WARNING]
> Hard coded folder location.

## Darktide Clear PowerDI
The Darktide [Power DI Mod](https://www.nexusmods.com/warhammer40kdarktide/mods/281) stores its settings in the game's AppData folder, and these can get quite bloated over time. Only this mod (so far) uses the .old and .sav files, so just trash them all. I've cleared out like 3 GB of saved game histories lol. Needs sudo. Hardcoded folder location.

## Create New Darktide Mod
Creates a new Darktide mod for each argument, which are separated by spaces. Mod names therefore cannot contain spaces. Mods are created in current working directory.

Initializes mod files with basic data/localization setup and the version logging on game load.

## Darktide Link Repo to Game
Creates a symlink from a mod development folder to the game folder. Takes the path to the mod folder in the repository. 

> [!WARNING]
> Game folder location is hard coded.

## Darktide Create Mod and Repo
For each given mod name, create a repository folder in the mod development folder and symlink it to the game. 

> [!WARNING]
> Mod development folder location is hard coded here.
>
> Game folder location is hard coded in one of the called scripts.
>
> Calls the previous two scripts.

## Gladius Create .ext Files Here
For each `.xml` file in the current working directory, create an empty `.xml.ext` file for it and append the XML versioning statement.

## Gladius Move .ext files to Directory
Moves all `.xml.ext` files in the current working dirctory to the given directory.

# Resources Referenced
- https://linuxhandbook.com/bash/
- [bin/bash shebang explanation](https://stackoverflow.com/questions/13872048/bash-script-what-does-bin-bash-mean)
- [chmod](https://linuxize.com/post/chmod-command-in-linux/)
- [Append text to file](https://stackoverflow.com/questions/17701989/how-do-i-append-text-to-a-file)
- [Using sudo with aliased commands](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Aliases)
