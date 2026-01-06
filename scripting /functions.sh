#!/bin/bash

# this is postion parapters are special variables that hold argument thay are passed thought a function or a script using numbered arguments 
#special parameters hold throught special characters 

#-----------
# print_args(){
#     echo "Number of arguments: $#"
#     echo "Script name: $0"
#     echo "First argument: $1"
#     echo "Second argument: $2"
#     echo "All argument: $@"
# }

# print_args "Abdi" "Ali" "Ahmed"
#--------------

#------------------
# greet_user(){
#     echo "What is your name?"
#     read name 
#     echo "Hello, $name!"
# }

# greet_user
#------------------

# this is for piping and how it works

# get_file_count(){
#     local directory="$1"
#     local file_count 

#     file_count=$(ls "$directory" | wc -l)
#     echo "Number of files in $directory: $file"

# }


# get_file_count "./"

#------------------


#if you use the > to write to file it add data to the file and if you use the apens data >> it add data to the file without removing the orginal content 
# write_to_file() {
#     local file_path="$1"
#     local data="$2"

#     echo "$data" > "$file_path"
# }

# write_to_file "read.txt" "hello World"

#------------------

#checking file check sums it is a unique file identifer most common are the md5sum and the sha256sum 

# calculate_md5sum() {
#     local file_path="$1"
#     md5sum "$file_path"

# }

# calculate_md5sum "read.txt"
#----------------------

#next is to compare two different check sums to see how they compare 

compare_checksum() {
    local checksum1="$1"
    local checksum2="$2"
if [[ "$checksum1" == "$checksum2" ]]; then 
    echo "Good! Checksums match"

else 
    echo "failed! Checksums do not match"
fi 

}

compare_checksum "123" "123"