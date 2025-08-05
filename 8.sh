#!/bin/bash

################################################################################
#Script Name   : Directory Size Check
#Author        : Rajkumar_Makwana
#Creation_Date : 30-07-2025
#Description   : Create a script that checks the size of a specified directory and warns if it exceeds a certain limit (e.g.
#                , 100MB).
#################################################################################


# Define size limit in MB
LIMIT_MB=1

#Read directory from user
read -p "Enter the directory path to check: " DIR

# Check if directory exists
if ! [ -d "/home/raj170442/$DIR" ]; then
  echo "Error: '$DIR' is not a valid directory."
  exit 1
fi

# Get directory size in MB 
SIZE_MB=$(du -s "/home/raj170442/$DIR" | awk '{print int($1 / 1024)}')

# Display the size of Directory
echo "The size of the directory $DIR is ${SIZE_MB}MB."

#now compare with limit
if [ "$SIZE_MB" -gt "$LIMIT_MB" ]; then
  echo "The size exceeds the ${LIMIT_MB}MB limit!"
else
  echo "The directory is in limit."
fi










