#!/bin/bash
# Converts webp to png and delete them. Only in the current working directory
parallel --progress dwebp {} -o {.}.png ::: *.webp
find . -name "*.webp" -type f -delete
