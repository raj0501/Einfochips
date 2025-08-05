#!/bin/bash

################################################################################
#Script Name   : Generate Random Password
#Author        : Rajkumar_Makwana
#Creation_Date : 30-07-2025
#Description   : Create a script that generates a random password of a given length using alphanumeric and special characters.
#################################################################################


#Read The value of 
read -p "Enter the password length: " LENGTH

# Validate input
if [ -z "$LENGTH" ];then
	echo "Password length can not be empty"
	exit 1
elif [[ "$LENGTH" == 0 ]];then
	echo "Password length must be greater than 0"
	exit 1
elif  [[ "$LENGTH" =~ ^[-][0-9]+([.][0-9]+)?$ ]]; then
  echo "Please Enter Positive Number"
  exit 1
elif ! [[ "$LENGTH" =~ ^[0-9]+$ ]]; then
  echo "Invalid input provided,this is not a numeric value."
  exit 1
fi


LENGTH_INT=$((LENGTH))

# Check for zero or negative values
if [ "$LENGTH_INT" -le 0 ]; then
  echo "Error: Password length must be a positive value greater than 0."
  exit 1
fi

# Generate password
PASSWORD=$(< /dev/urandom tr -dc 'A-Za-z0-9!@#$%^&*()-_=+{}[]:;<>?' | head -c "$LENGTH_INT")
echo "Generated password: $PASSWORD"



