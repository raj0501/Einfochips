#!/bin/bash

################################################################################
#Script Name   : Recursive File Search
#Author        : Rajkumar_Makwana
#Creation_Date : 30-07-2025
#Description   : Write a script to search for a given file name recursively in a specified directory and print the full path if found.
#################################################################################

#Read file name and directory name
read -p "Enter the file name to search for: " FILENAME
read -p "Enter the directory to search: " SEARCH_DIR

if [ -z "$FILENAME" ]; then
  echo "Error: File name cannot be empty."
  exit 1
elif [ -z "$SEARCH_DIR" ]; then
  echo "Error: Search directory cannot be empty."
  exit 1
fi



# Expand ~ to home directory
HOME="/home/raj170442"
SEARCH_DIR="${SEARCH_DIR/#\~/$HOME}"

if [ ! -d "$SEARCH_DIR" ]; then
  echo "Error: Directory '$SEARCH_DIR' not found."
  exit 1
fi

RESULT=$(find "$SEARCH_DIR" -type f -name "$FILENAME" 2>/dev/null)

if [ -n "$RESULT" ]; then
  echo "Found $FILENAME at: $RESULT"
else
  echo "File '$FILENAME' not found in '$SEARCH_DIR'."
fi

