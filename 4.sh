#!/bin/bash

##############################################################
#Script Name   : Palindrome
#Author        : Rajkumar_Makwana
#Creation_Date : 25-07-2025
#Description   :Write a script to check if a given string is a palindrome.
##############################################################


#read string from user
read -p "Enter String :" str

#checking that string is empty or not
if [[ $str == "" ]]
then
	echo "This is Empty String"
	exit 1
fi

#find the length of string
strlen1=${#str}
str1=$(echo "$str" | tr [A-Z] [a-z] )

#loop for removeing space
for (( i= 0;i<$strlen1;i++ ))
do
	char=${str1:i:1}
	if [[ $char != " " ]]
	then
		wsstr="$wsstr$char"
	fi
done

#calculate the length of new string and declare a empty variable
wsstrlen=${#wsstr}
rev=""

#loop ifor reverse the string by accessing from last element
for (( i=$wsstrlen-1 ; $i>=0; i-- ))
do
	rev="$rev${wsstr:$i:1}"
done



#comparing Original string and revese string
if [[ $wsstr == $rev ]]
then
	echo "The String $str is a palindrome"
else
	echo "The String $str is not a palindrome"
fi

