#!/bin/bash 

#!/bin/bash

# 1. Create directories
mkdir -p Arena_Boss Victory_Archive

# 2. Create files inside Arena_Boss
for i in {1..5}; do
    file="Arena_Boss/file$i.txt"

    # 3. Generate random number of lines (10–20)
    lines=$((RANDOM % 11 + 10))

    for ((j=1; j<=lines; j++)); do
        echo "Battle line $j" >> "$file"
    done
done

# Optional: randomly add "Victory" to some files
grep -q "Victory" Arena_Boss/file*.txt || echo "Victory" >> Arena_Boss/file3.txt

# 4. Sort files by size
echo "Files sorted by size:"
ls -lhS Arena_Boss

# 5. Move files containing 'Victory'
for file in Arena_Boss/*.txt; do
    if grep -q "Victory" "$file"; then
        mv "$file" Victory_Archive/
    fi
done
