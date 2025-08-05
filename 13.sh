#!/bin/bash

################################################################################
#Script Name   : User Login Tracker
#Author        : Rajkumar_Makwana
#Creation_Date : 30-07-2025
#Description   : Create a script that tracks and logs user logins and logout events, appending the data to a log file.
#################################################################################


#read path from user
read -p "Enter the log file path: " LOG_PATH

#check for empty input
if [ -z "$LOG_PATH" ]; then
  echo "Log file path cannot be empty."
  exit 1
fi

#Must end in .log
if [[ ! "$LOG_PATH" =~ \.log$ ]]; then
  echo "Invalid path. Please provide a .log file."
  exit 1
fi

#Expand ~ to full home path
LOG_PATH="${LOG_PATH/#\~/$HOME}"


#Extract directory and validate
LOG_DIR=$(dirname "$LOG_PATH")
if [ ! -d "$LOG_DIR" ]; then
  echo "Directory '$LOG_DIR' does not exist."
  exit 1
fi


#Get login/logout info using last (excluding reboots and wtmp messages)
LOGIN_DATA=$(last -w | grep -v 'reboot' | grep -v 'wtmp begins')

# Append data to user-provided log file
echo "--------- User Login/Logout Events - $(date) --------" >> "$LOG_PATH"
echo "$LOGIN_DATA" >> "$LOG_PATH"

# Create login_tracking.txt in same folder
TRACKING_FILE="$LOG_DIR/login_tracking.txt"
echo "$LOGIN_DATA" > "$TRACKING_FILE"

echo "User login/logout tracking complete. Data saved to $TRACKING_FILE."
