#!/bin/bash
# Given the names of fonts downloaded into the working directory, installs them
# $@ is all arguments. expands to nothing if no args (NOT empty string :D)
for i in "$@"; do
    {   # pseudo try 
        mkdir /usr/local/share/fonts/$i &&
        unzip $i.zip -d /usr/local/share/fonts/$i
    } || { # catch. or (||) means this only happens if the first guy failed
        echo "Provide at least one font in the working directory. List each font as an argument in the script, exactly as its archive is named (without the .zip extension)"
    }
done

