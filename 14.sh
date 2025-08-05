#!/bin/bash

################################################################################
#Script Name   : Count occurrence of each word
#Author        : Rajkumar_Makwana
#Creation_Date : 31-07-2025
#Description   : Write a script to count the number of occurrences of each word in a given text file, sorted by frequency.
#################################################################################



#take txt file from user
read -p "Enter path of txt file:" INP_FILE

#complete the path
INP_FILE="${INP_FILE/#\~/$HOME}"

#check file is availabe or not and input is empty or not 
if [ -z "$INP_FILE" ]; then
	echo "File path cannot be empty"
  	exit 1
fi
if [ ! -e "$INP_FILE" ]; then
  	echo "The file '$INP_FILE' does not exist"
  	exit 1
fi

#check file is txt or not
if [[ "$INP_FILE" != *.txt ]]; then
	echo "This file type is not valid ,Only txt file allow"
  	exit 1
fi

#check that user have permission to read file or not
if [ ! -r "$INP_FILE" ]; then
  	echo "You Can't read this file"
  	exit 1
fi

#check that file is empty or not
if [ ! -s "$INP_FILE" ]; then
  	echo "The file '$INP_FILE' is empty"
	exit 1
fi

#print 
echo "Word frequency analysis:"
tr -cs '[:alnum:]' '[\n*]' < "$INP_FILE" | sort | uniq -c | sort -nr




