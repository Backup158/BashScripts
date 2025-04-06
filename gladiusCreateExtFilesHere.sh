#!/bin/bash
# Creates extended xml files for all files in working directory

# Check what exists before making any
for file in *; do 
    # Reports if there's an existing one
    # Separate echos for readable code
    if [ -f "$file" ] && [[ $file == *.xml.ext ]]; then 
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"        
        echo "Found before creating anything:\n${file}"
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    fi 
done

for file in *; do 
    # Creates ext files
    if [ -f "$file" ] && [[ $file == *.xml ]]; then 
        touch "${file}.ext"
        # Adds the encoding info
        echo "<?xml version="1.0" encoding="utf-8"?>" > "${file}.ext"
    fi 
done

