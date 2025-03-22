#!/bin/bash
# Creates a mod for Darktide in the cwd

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

# Creates a mod for each argument
for arg in "$@"
do
    # Creating a mod with escaped spaces causes ambiguous redirects, so don't support that
    pattern=" "
    if [[ "${arg}" =~ "${pattern}" ]]
    then
        echo "!!!!!!!!!!!! Mod contains spaces. Aborting operation."
        echo "   ${arg}"
        continue
    fi

    # Creates mod directories
    mkdir -p $arg/scripts/mods/$arg/

    # Creates .mod file
    #   -e allows for interpretation of escape sequences
    #   escape the backticks ` or else it will try to execute $arg
    touch $arg/$arg.mod
    echo -e "return {\n    run = function()\n        fassert(rawget(_G, \"new_mod\"), \"\`$arg\` encountered an error loading the Darktide Mod Framework.\")\n\n        new_mod(\"$arg\", {" >> $arg/$arg.mod
    echo "            mod_script       = \"$arg/scripts/mods/$arg/${arg}\"," >> $arg/$arg.mod
    echo "            mod_data         = \"$arg/scripts/mods/$arg/${arg}_data\"," >> $arg/$arg.mod
    echo "            mod_localization = \"$arg/scripts/mods/$arg/${arg}_localization\"," >> $arg/$arg.mod
    echo -e "        })\n    end,\n    packages = {},\n}" >> $arg/$arg.mod

    # Creates mod .lua files
    #   Main
    touch $arg/scripts/mods/$arg/$arg.lua
    echo "local mod = get_mod(\"${arg}\")" >> $arg/scripts/mods/$arg/$arg.lua
    echo "mod.version = \"1.0\"" >> $arg/scripts/mods/$arg/$arg.lua
    echo -e "\n--#################################\n-- Requirements\n--#################################\n\n\n--#################################\n-- Hooks\n--#################################" >> $arg/scripts/mods/$arg/$arg.lua
    echo "mod.on_all_mods_loaded = function()" >> $arg/scripts/mods/$arg/$arg.lua
    echo "    mod:info(\"${arg} v\" .. mod.version .. \" loaded uwu nya :3\")" >> $arg/scripts/mods/$arg/$arg.lua
    echo -e "\n\n\nend" >> $arg/scripts/mods/$arg/$arg.lua
    #   Data
    touch $arg/scripts/mods/$arg/${arg}_data.lua
    echo "local mod = get_mod(\"${arg}\")" >> $arg/scripts/mods/$arg/${arg}_data.lua
    echo -e "return {\n    name = mod:localize(\"mod_name\"),\n    description = mod:localize(\"mod_description\"),\n    is_togglable = true,\n}" >> $arg/scripts/mods/$arg/${arg}_data.lua
    #   Localization
    touch $arg/scripts/mods/$arg/${arg}_localization.lua
    echo -e "return {\n    mod_name = {\n        en = \"$arg\",\n    },\n    mod_description = {\n        en = \"\",\n    },\n}" >> $arg/scripts/mods/$arg/${arg}_localization.lua

    # Confirmation message
    echo "Created mod: $arg"
done
