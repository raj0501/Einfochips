#!/bin/bash

################################################################################
#Script Name   : Add User to system
#Author        : Rajkumar_Makwana
#Creation_Date : 29-07-2025
#Description   : Write a script that adds a new user to the system (requires root privileges) and sets
#     		 a default password.
#################################################################################


#!/bin/bash

# Check that script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: Run this script as root."
  exit 1
fi

# Read value of User Name
read -p "Enter the username to add: " USERNAME

# Trim whitespace from input
USERNAME=$(echo "$USERNAME" | xargs)

# Validate input
if [ -z "$USERNAME" ]; then
  echo "Error: Username cannot be empty."
  exit 1
fi

# Check for spaces in username
if [[ "$USERNAME" =~ \  ]]; then
  echo "Error: Username cannot contain spaces."
  exit 1
fi

# Check if user already exists
if id "$USERNAME" &>/dev/null; then
  echo "Error: User '$USERNAME' already exists."
  exit 1
fi

# Add user and set password
sudo useradd "$USERNAME"
echo "$USERNAME:password123" | chpasswd

echo "User '$USERNAME' added successfully with default password 'password123'."


