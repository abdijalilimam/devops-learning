#!/bin/bash
#this is for nested if statements
age=18
grade=85

if [ $age -gt 18 ]; then 
    echo "you are elegiable"
    if [ $grade -ge 80 ]; then 
        echo "you are elegiable based on grade"
        echo "congratulations you qualified for schoolarship"
    else 
        echo "sorry you are not elegiable based on grade"
    fi
else 
    echo "Sorry you are not elegiable"
fi