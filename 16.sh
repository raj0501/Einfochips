#!/bin/bash

################################################################################
#Script Name   : Find the kernal panic , segmentation fault messages
#Author        : Rajkumar_Makwana
#Creation_Date : 01-08-2025
#Description   : Write a script to  Read the Kernel log file to find the kernel panic , segmentation fault messages with full line with timestamp.
#################################################################################

#Define log file path
LOG_FILE="/var/log/kern.log"

#Check log file
if [ ! -f "$LOG_FILE" ]; then
    echo "Kernel log file not found at $LOG_FILE"
    exit 1
fi

if [ ! -r "$LOG_FILE" ]; then
    echo "Cannot read kernel log file. Permission denied."
    exit 1
fi

#Search for kernel panic and segmentation fault messages
echo "Searching for kernel panic and segmentation fault messages..."
grep -Ei 'kernel panic|segfault|segmentation fault' "$LOG_FILE"









