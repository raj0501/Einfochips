#!/bin/bash

################################################################################
#Script Name   : Generate a disk usage Report
#Author        : Rajkumar_Makwana
#Creation_Date : 30-07-2025
#Description   : Write a script that generates a disk usage report for all mounted file systems and saves it to a file.
#################################################################################


#Read File Name
read -p "Enter the output file to save the disk usage report: " OUTPUT_FILE

#check for file extention and file name is empty or not
if [ -z "$OUTPUT_FILE" ]
then	
	echo "Please Enter File Name"
	exit 1
fi

if [[ ! "$OUTPUT_FILE" =~ \.txt$ ]]; then
  echo "Please enter a .txt file."
  exit 1
fi


#Get current timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

#get report and add timestamp to that
REPORT="Disk Usage Report - $TIMESTAMP-------$(df -h)"

#if file is already created then overridden that and if not then create new and add report in it
if [ -f "$OUTPUT_FILE" ]; then
  echo "$REPORT" > "$OUTPUT_FILE"
  echo "Disk usage report file saved and data overridden $OUTPUT_FILE."
else
  touch "$OUTPUT_FILE" && echo "$REPORT" > "$OUTPUT_FILE"
  echo "File created... Disk usage report saved to $OUTPUT_FILE."
fi


