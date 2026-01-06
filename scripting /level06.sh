#!/bin/bash 

# $user_input → first argument to script
# -z → checks if empty
# -f → checks if file exists
# ! → negates a test
# wc -l < file → counts lines only
# $(...) → store command output in a variable
# exit 1 → stops the script on error
read -p "Please enter a file name: " user_input 

if [ -z "$user_input" ]; then 
    echo "No file provided!"
    exit 1 
fi 

if [ ! -f "$user_input" ]; then 
    echo "File not found!" 
    exit 1 
fi 

LINE_COUNT=$(wc -l < "$user_input")
echo "The file $user_input has $LINE_COUNT lines."
