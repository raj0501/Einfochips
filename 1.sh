#!/bin/bash
###############################################################################
#Script Name   : Calculator 
#Author        : Rajkumar_Makwana
#Creation_Date : 25-07-2025
#Description   : Write a script to take two numbers as input and perform 
#		 addition, subtraction, multiplication, and division  
###############################################################################


#read number value from user 
read -p "Enter 1st Number:" num1
read -p "Enter 2nd Number:" num2

#now validate that values
if ! [[ $num1 =~ ^-?[0-9]+([.][0-9]+)?$ ]]  #if value is not  a number then this will execute / for number1 
then
	echo "num 1 is not valid number"
elif ! [[ $num2 =~ ^-?[0-9]+([.][0-9]+)?$ ]] #if value is not a number then this will execute / for number2
then
	echo "num 2 is not valid number"
else #if both values are number then this will excute
	let add=$(($num1+$num2)) #perform addition operation
	let sub=$(($num1-$num2)) #perform Substraction operation
	let mul=$(($num1*$num2)) #perform Multiplication Operation

	#Print above operation values
	echo "Add : $add"
	echo "Sub : $sub"
	echo "Mul : $mul"

	#check if both value is zero the undefind
	if [[ $num1 == 0  && $num2 == 0 ]]
	then
		echo "Div : undefined"
	# if number 2 is zero the print message can not divide by zero
	elif [[ $num2 == 0 ]]
	then 
		echo "Div : Can not divide by Zero Error....."
	else
		#perform division operation and print that values 
		div=$(echo "scale=2 ; $num1 / $num2" | bc -l) 
		#here scale=2 that  print 2 number after dot -l gives 20 numbers after the dot
		#here scale=2 that  print 2 number after dot -l gives 20 numbers after the dot
		#here scale=2 that  print 2 number after dot -l gives 20 numbers after the dot
		echo "Div : $div"
	fi
fi

	






