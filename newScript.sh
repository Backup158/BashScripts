#!/bin/bash

# Only creates one script at a time.
# this damn whitespace lmao
if [ $# -ne 1 ]; then
    echo "Usage: $0 <script name w/o extension>"
    exit 1
fi

scriptName=$1
scriptFile="${scriptName}.sh"
cd ~/Scripts
touch $scriptFile
chmod +x $scriptFile
# Appends the whole shebang (what to interpret the script with)
echo '#!/bin/bash' >> $scriptFile
# Gets the description for the script
echo -n 'Enter the description for this script: '
read desc
# Appends description to the script. Without -n because I want the newline.
commentedDesc="# ${desc}"
echo $commentedDesc >> $scriptFile
# Also append to aliases file
echo $commentedDesc >> ~/.bash_aliases
echo "alias ${scriptName}='~/Scripts/${scriptFile}'" >> ~/.bash_aliases
# Opens the script in Xed text editor
#   Have already cd'd to ~/Scripts
xed $scriptFile
