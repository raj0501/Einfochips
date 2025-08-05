#!/bin/bash

################################################################################
#Script Name   : File Globing
#Author        : Rajkumar_Makwana
#Creation_Date : 31-07-2025
#Description   : File Globing  :  Create Files and Folders for  details entered : Take linux username , GID,firstname, taskid  as input  Script should Create main directory : GID_ Firstname Script should create TaskName wise subfolders Within TaskName sub folder generate all files as with an appropriate extension( .c / .h / .sh / .xls / .ko  / .a / .so )  
#	e.g. GID_Firstname_TaskName_Module_Task1.c  
#       153194_Akshat_DenicR_Module1_ task1.c 
################################################################################

#Function to check for empty input
check_empty() {
    if [[ -z "$1" ]]; then
        echo "All inputs are required."
        exit 1
    fi
}

#Function to validate task name (no spaces)
validate_taskname() {
    if [[ "$1" =~ \  ]]; then
        echo "Spaces not allowed in taskname. Use underscores (_) instead."
        exit 1
    fi
}

#read the values from user
read -p "Enter Linux username: " USERNAME
check_empty "$USERNAME"

read -p "Enter GID: " GID
check_empty "$GID"

read -p "Enter Firstname: " FIRSTNAME
check_empty "$FIRSTNAME"

read -p "Enter TaskID (e.g., task1): " TASKID
check_empty "$TASKID"

read -p "Enter TaskName (e.g., DenicR): " TASKNAME
check_empty "$TASKNAME"
validate_taskname "$TASKNAME"

read -p "Enter Module number (e.g., Module1): " MODULE
check_empty "$MODULE"

read -p "Enter file extension (e.g., c): " EXT
check_empty "$EXT"

#Define paths
MAIN_DIR="${GID}_${FIRSTNAME}"
TASK_DIR="${MAIN_DIR}/${TASKNAME}"

#Directory checks
if [ -d "$MAIN_DIR" ]; then
    if [ -d "$TASK_DIR" ]; then
        echo "Directory already exists: '$TASK_DIR'"
        exit 1
    else
        echo "Folder exists. Making subfolder '$TASKNAME'..."
        mkdir -p "$TASK_DIR"
    fi
else
    echo "Creating main and task directories..."
    mkdir -p "$TASK_DIR"
fi

#Generate file
FILENAME="${GID}_${FIRSTNAME}_${TASKNAME}_${MODULE}_${TASKID}.${EXT}"
touch "${TASK_DIR}/${FILENAME}"

#Status update
echo "File created successfully inside '$TASK_DIR':"
ls "${TASK_DIR}"




