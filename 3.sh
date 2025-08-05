#!/bin/bash

###############################################################################
#Script Name   : Maximum From 3 Numbers
#Author        : Rajkumar_Makwana
#Creation_Date : 25-07-2025
#Description   : Write a script to compare three numbers and print the largest one
###############################################################################



#Read 3 Numbers From User
read -p "Enter First Number:" num1
read -p "Enter Second Number:" num2
read -p "Enter Third Number:" num3

#Now check that entered values are number

if ! [[ $num1 =~ ^-?[0-9]+([.][0-9]+)?$ ]]
then 
	echo "Num1 is not valid number"
elif ! [[ $num2 =~ ^-?[0-9]+([.][0-9]+)?$ ]]	
then
	echo "Num2 is not valid number"
elif ! [[ $num3 =~ ^-?[0-9]+([.][0-9]+)?$ ]]
then
	echo "Num3 is not valid number"
else
	#if number 1 is greater then 2 and 3 
	if [[ $(echo "$num1 > $num2 && $num1 > $num3" | bc) -eq 1 ]]
	then 
		echo "$num1"
	#Now check for number 2 is greather then 3 then 2nd is largerst
	elif [[ $(echo "$num2 > $num3" | bc) -eq 1 ]]
	then
		echo "$num2"
	else
	#third is largest
		echo "$num3"
	fi
fi

