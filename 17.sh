#!/bin/bash

################################################################################
#Script Name   : Log File for any c program
#Author        : Rajkumar_Makwana
#Creation_Date : 01-08-2025
#Description   : Generate the log file for any c program.
#################################################################################

# Check if input is empty
if [ -z "$1" ]; then
    echo "Input cannot be empty" >> log.txt
    exit 1
fi

# Check if input is a .c file
if [[ "$1" != *.c ]]; then
    echo "only .c file taken as input" >> log.txt
    exit 1
fi

# Check if file exists
if [ ! -f "$1" ]; then
    echo "$1 file does not exist" >> log.txt
    exit 1
fi

# Check if file is empty
if [ ! -s "$1" ]; then
    echo "that file in log file empty" >> log.txt
    exit 1
fi

# Compile and run the C file, store output in log
gcc "$1" -o temp.out 2>> log.txt


if [ $? -eq 0 ]; then
    ./temp.out >> log.txt 2>&1
    echo "Script Run Successfully , You can check log.txt file" 
else
    echo "Compilation failed" >> log.txt
fi










