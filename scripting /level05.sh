#!/bin/bash
#making folders 
mkdir Battlefield 
mkdir Archive


#inside battlefied folder 
cd Battlefield

#created files inside 
touch knight.txt sorcerer.txt rogue.txt

#checking if knight.txt exist as a regular file then using mv to move to Archive folder 
# using ../ to go out of the battlefield then moving mv knight to the Archive folder 
if [ -f knight.txt ]; then
    
    mv knight.txt  ../Archive/
fi 

#listing content of both folders 
ls 
ls ../Archive


