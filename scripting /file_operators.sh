#!/bin/bash
#way to read files and extract info 
# read_file() {
#     local file_path="$1"

#     while IFS= read -r line; do 
#         echo "$line"
#     done < "$file_path"
# }
# read_file "./log.txt"


process_file() {
    local file_path="$1"
    cat "$file_path" | while IFS= read -r line; do 
        echo "processing line: $line"

    done 
}

process_file "./for.sh"