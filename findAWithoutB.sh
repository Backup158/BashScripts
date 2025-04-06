#!/bin/bash
# script to alias greps to search all files in directory and find string A without instances of B

grep -Rv "$2" | grep "$1"
