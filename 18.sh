#!/bin/bash

################################################################################
#Script Name   : Check coding standards appied in .c file or not
#Author        : Rajkumar_Makwana
#Creation_Date : 01-08-2025
#Description   : Write script which takes .c file as input and checks whether coding standards are applied .
#################################################################################


file="$1"

#Check for file is valid and not empty
if [ -z "$file" ]; then
    echo "Please Enter File Name Empty not allowed."
    exit 1
fi

if [[ "$file" != *.c ]]; then
    echo "Only .c files are accepted."
    exit 1
fi

if [ ! -f "$file" ]; then
    echo "File '$file' does not exist."
    exit 1
fi

if [ ! -s "$file" ]; then
    echo "File is empty."
    exit 1
fi

echo "Checking coding standards for '$file'..."

#Check for author name in comments
grep -Ei 'author|created by' "$file" > /dev/null
if [ $? -eq 0 ]; then
    echo "Author name found in comments."
else
    echo "Author name missing in comments."
fi

#Check for creation date
grep -Ei 'date|created on' "$file" > /dev/null
if [ $? -eq 0 ]; then
    echo "Creation date found in comments."
else
    echo "Creation date missing in comments."
fi

#Check for declared functions and usage
declared_funcs=$(grep -E '^[a-zA-Z_][a-zA-Z0-9_]*\s+[a-zA-Z_][a-zA-Z0-9_]*\s*\(.*\)\s*\{' "$file" | awk '{print $2}' | sed 's/(.*//')
used_funcs=()
for func in $declared_funcs; do
    grep -q "$func(" "$file"
    if [ $? -eq 0 ]; then
        used_funcs+=("$func")
    fi
done

if [ ${#used_funcs[@]} -eq 0 ]; then
    echo "Functions declared but not used."
else
    echo "Functions declared and used: ${used_funcs[*]}"
fi

#Check variable naming (lowercase_with_underscores)
bad_vars=$(grep -E 'int|char|float|double' "$file" | grep -vE '[a-z_]+[a-z0-9_]*' | grep -v 'main')
if [ -z "$bad_vars" ]; then
    echo "Variable naming looks proper."
else
    echo "Variable naming may not follow lowercase_with_underscores."
fi







