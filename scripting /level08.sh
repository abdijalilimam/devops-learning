#!/bin/bash

DIRECTORY="Arena" 
SEARCH_TERM="Error"


#if directory does not exist then echo it does not exist 
if [ ! -d "$DIRECTORY" ]; then 
    echo "Directory does not exist."
    exit 1
fi 


grep -1 "$SEARCH_TERM" "$DIRECTORY"/*.log