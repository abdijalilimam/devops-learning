# this is a how else if statement works in bash

#!/bin/bash
# Prompt the user for input
echo "Enter your exam score $user_input (1-100):"

# Read the input from the user and store it in the 'user_input' variable
read user_input

# --- Determine the $user_input/grade based on the input ---

# Ensure the input is a valid number for comparison (optional but good practice)
if ! [[ "$user_input" =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid input. Please enter a number."
    exit 1
fi

 if [ "$user_input" -ge 90 ]
 
 then 
    echo "Score: A (WOW!)"
 
 elif [ "$user_input" -ge 80 ]

 then 
    echo "Score: B (Execellent!)"

 elif [ "$user_input" -ge 70 ]

 then 
    echo "Score: C (Average)"

elif [ "$user_input" -ge 60 ]

then 
    echo "Score: D (Needs Improvement)"

 else 

    echo "Scored: F  Failed (Work Harder!)"

 fi