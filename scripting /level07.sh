#!/bin/bash

FOLDER="Arena"

if [ ! -d "$FOLDER" ]; then 
    echo "Directory not found!"
fi 

find "$FOLDER" -type f -name "*.txt" -exec ls -lh {} + | sort -k 5,5 -h | awk '{ print $5, $9 }'