#i/bin/bash

#create an array with 3 elements 
fruits=("appel" "banana" "orange")

#initialize index variable with zero 
index=0 

#loop through the array using while loop
while [ $index -lt ${#fruits[@]} ]
#does the following until the condition is ends 
do 
    echo "Fruit: ${fruits[$index]}"
    ((index++))             
#loop ends here  
done                               