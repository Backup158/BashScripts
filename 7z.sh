#!/bin/bash

# With only 1 argument, unzip to working directory
#   with 2, unzip to destination
#   $# is number of arguments
if ["$#" -e 1]; then
    /usr/7z $1
elif ["$#" -e 2]; then
    /usr/7z $1 $2
else
    echo "Usage: $0 <zip file> <OPT: destination>"
    exit 1
fi
