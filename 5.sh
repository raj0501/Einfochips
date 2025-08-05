#!/bin/bash

################################################################################
#Script Name   : File Backup 
#Author        : Rajkumar_Makwana
#Creation_Date : 28-07-2025
#Description   : Write a script that takes a directory as input, creates a backup of all .txt files, 
#                and stores them in a compressed archive with the current date as the filename.
#################################################################################


# Get current date in YYYY-MM-DD format
DATE=$(date +%F)


# Prompt user for directory to back up
read -p "Enter the directory path to back up: " DIR_PATH

# Check if directory exists
if [ ! -d "/home/raj170442/$DIR_PATH" ]; then
  echo "Error: Directory '$DIR_PATH' does not exist."
  exit 1
fi


# Create temporary folder for .txt files
TEMP_DIR=~/temp_txt_backup
mkdir -p "$TEMP_DIR"


# Count .txt files in the directory
TXT_COUNT=$(find "/home/raj170442/$DIR_PATH" -type f -name "*.txt" | wc -l)

#in above find command finds in subdirectory also but if we want to limit in only that folder then we have to add
# -maxdepth 1 


# If no .txt files found
if [ "$TXT_COUNT" -eq 0 ]; then
  echo "The folder does not contain any .txt files."
  exit 0
fi

# Copy all .txt files into temporary folder
find "/home/raj170442/$DIR_PATH" -type f -name "*.txt" -exec cp {} "$TEMP_DIR" \;


# Create compressed tar archive with current date
ARCHIVE_NAME=backup_"$DATE".tar.gz
tar -czf ~/"$ARCHIVE_NAME" -C "$TEMP_DIR" .


# Clean up temporary folder
rm -r "$TEMP_DIR"

# Output message
echo "Backup of .txt files from $DIR_PATH has been created with the filename: $ARCHIVE_NAME in home directory"






