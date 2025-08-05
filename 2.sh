#!/bin/bash

############################################################################
#Script Name   : Odd or Even Number
#Author        : Rajkumar_Makwana
#Creation_Date : 25-07-2025
#Description   : Create a script that checks if a given number is even or odd. (Take User Input )
############################################################################


#read number from user
read -p "Enter Number :" num1

#check that entered value is number
if ! [[ $num1 =~ ^-?[0-9]+([.][0-9]+)?$ ]]
then
	echo "not a valid number "
else
	#check that only interger number and float number with decimal value only 0 will allow,float value is not allowed
	if ! [[ $num1 =~ ^-?[0-9]+([.][0]+)?$ ]]
	then 
		echo  "float is not valid"
	else
		intnum=${num1%.*}   #remove decimal values
		ans=$(($intnum%2))	#modulo number
		if [[ $ans == 0 ]]
		then
			echo "$num1 is Even Number"
		else
			echo "$num1 is Odd Number"
		fi
	fi
fi


