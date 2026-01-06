#!/bin/bash

MONITOR="Arena"
LOG_CHANGES="Log_changes.txt"
INTERVAL=60 # this checks every 10 seconds 

#checks if "monitor" which is a regular file type has been modified "-mmin -60" in the last hour 
while true; do 
    if find "$MONITOR" -type f -mmin -1 -print -quit | read; then
    echo "$(date): File has been modified!" | tee -a "$LOG_CHANGES"
    fi 
        sleep $INTERVAL
    done 
