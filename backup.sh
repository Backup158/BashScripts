#! /bin/bash

#cp "$1"{,_backup} 
#mv "$1_backup" "$1.bak"

for var in "$@"
do
	cp "$var"{,_backup} 
	mv ""$var"_backup" "$var.bak"
done