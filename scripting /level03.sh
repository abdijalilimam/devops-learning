#!/bin/bash 
#if statement that use -e to see if a file exists following the file name 
#then if file does exist then it will echo hero found if not then it will echo hero missing.
# i use -e instead of -f just to see if even the name exist where -f is used to see if a regualr file exist.


if [ -e hero.txt]; then
    echo "Hero found!"
else 
    echo "Hero missing!"
fi 