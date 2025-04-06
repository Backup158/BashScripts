#!/bin/bash
# Moves all .xml.ext files in this folder to the given directory

# Argument check
if [ "$#" -ne 1 ]
then
    echo "Only give one argument! Rerun this script. Be sure to encapsulate the path in quotes if there's spaces."
    exit 1
fi

# Move file
for file in *; do 
    if [ -f "$file" ] && [[ $file == *.xml.ext ]]; then 
        # Makes you confirm to overwrite
        mv -iv $file "$1/${file}"
    fi 
done
echo "======================= MOVE COMPLETE ======================="
ls
echo "======================= vvvvvvvv ======================="
ls "$1"
