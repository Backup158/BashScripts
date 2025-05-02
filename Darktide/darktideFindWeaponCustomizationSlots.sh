#!/bin/bash
# Finds slots added by weapon customization plugins
# Including trailing slash because that's what autocomplete does (for me)

# If no arguments given, print instructions and back tf out
if [ "$#" -eq 0 ]; then
    echo "No arguments given! Rerun the script and pass the mod names as arguments (including trailing slash /), which each mod separated by a space."
    exit 1
fi

# Initialize dump file with date
dump_file="dump.txt"
echo "#### INJECTIONS ###" > ${dump_file}
date --iso-8601 >> ${dump_file}

# Checks for slots in each plugin
for arg in "$@"; do
    # Add seperator for each plugin
    echo "##########################################" >> ${dump_file}
    echo "${arg}" >> ${dump_file}
    echo "##########################################" >> ${dump_file}

    # Get directory location for plugin slots
    #   Note: hard coded. MT and Syn plugins are formatted like this (plugin/weapon/weapon_files.lua) but OwO does not
    #   since I made OwO, idc to check it, but anyone using this may need to modify it
    plugin_weapons="$PWD/${arg}weapon/"
    for weapon in ${arg}weapon/*; do
        # Get weapon name from file (without the extension)
        weapon_name=$(basename "${weapon}" | sed "s/.lua//")
        #echo "$weapon_name" >> ${dump_file}

        # Find slot declarations
        #   Add weapon name
        #   Trim
        #   Append slot to dump file
        #   mod.wc.attachment[this_variant].sight_2 = {} --> autogun_p1_m1.sight_2
        replace_start="mod\.wc\.attachment\["
        replace_bracket="\]"
        replace_table=" = {}"
        grep -E "mod\.wc\.attachment\[this_variant\]\..* = \{\}" "${weapon}" | sed "s/this_variant/${weapon_name}/" | sed -e "s/${replace_start}//" | sed -e "s/${replace_bracket}//" | sed -e "s/${replace_table}//" >> ${dump_file}
    done
    echo "" >> ${dump_file}
done
