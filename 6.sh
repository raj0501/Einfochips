#!/bin/bash

################################################################################
#Script Name   : Process Monitoring
#Author        : Rajkumar_Makwana
#Creation_Date : 29-07-2025
#Description   : Create a script that checks if a specific process (given as an argument) is running and prints a message if it is not.
#################################################################################

#Take input from user
read -p "Enter the process name or PID to check: " PROC

#Check for empty input
if [ -z "$PROC" ]; then
    echo "Invalid input"
    exit 1
fi

#Check for multiple words
if [[ "$PROC" =~ \  ]]; then
    echo "Not running process (multiple inputs not allowed)"
    exit 1
fi

#Check if input is a PID
if [[ "$PROC" =~ ^[0-9]+$ ]]; then
    if ps -p "$PROC" > /dev/null 2>&1; then
        echo "$PROC is running"
    else
        echo "$PROC is not running process"
    fi
else
    #Check by process name
    if pgrep -fi "$PROC" > /dev/null 2>&1; then
        echo "$PROC is running"
    else
        echo "$PROC is not running process"
    fi
fi



