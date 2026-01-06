#!/bin/bash
#-------1---------
# num1=10
# num2=0

# #to handle error we made if statement to see if the number is equal or grater than zero then it show error

# if [ $num2 -eq 0 ]; then 
#     echo "Error: you can't divide by Zero"
#     exit 1
# fi 

# result=$((num1 / num2))

# echo "The result is: $result"
#-------------------

#---------2----------
# FILE="/nonexistent"

# if [[ -f "$FILE" ]]; then
#     echo "File exists."
# else
#     echo "File does not exist"
# fi 
#-------------------

#--------3-------------
#this example of a script that checks if a command exist and writes the exit code
#"command -v " check if a command exists
#selince the output and send it to  '2>dev/null'
# command -v git 2>/dev/null

# if [[ $? -ne 0 ]]; then 
#     echo "Git is not installed. Please install Git"
#     exit 1

# else 
#     echo "Git is installed"
# fi 
#----------------------

#----------4------------
# set -e is used so that the command stop as soon an error happends
# set -e 

# echo "Before the script"

# nonexistentcommand

# echo "After the script"
#-------------------


#-------5-----------
# set -u bugs out when there is error on your code set -u kick in and errors the progam out 
# set -u

# X=10
# Y=20
# Z=((x + Y + W))

# echo "Z equals: $Z"
#-------------------

#-------6-----------
# set -x it prints in the terminal before it is executed 

# set -x 

# echo "Starting the script"

# X=10
# Y=20 
# Z=$((X + Y))

# echo "The value of X is set to: $X"
#-------------------


#--------7----------
# run all the debuging at once. prints each command before executing it, then stop at the failling command and never proceed with un initialized variable 

set -eux
echo "This is a test"

X=10 
echo "This value of X is: $X"

nonexistent