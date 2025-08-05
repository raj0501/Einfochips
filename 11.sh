#!/bin/bash

################################################################################
#Script Name   : System Resource Monitoring
#Author        : Rajkumar_Makwana
#Creation_Date : 30-07-2025
#Description   : Write a script that monitors CPU and memory usage, logs the data to a file, and alerts if usage exceeds a specified threshold.
#################################################################################

#Read value from user
read -p "Enter the CPU usage threshold:" CPU_LIMIT
read -p "Enter the memory usage threshold:" MEM_LIMIT

# Output file for logging
log_file="resos_log.txt"





# Get CPU usage: top gives %Cpu(s): xx used by user + system
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk -F'[,:%]' '{usage=$2+$4; printf "%.0f", usage}')

# Get memory usage
mem_info=$(free | grep Mem)
total_mem=$(echo $mem_info | awk '{print $2}')
used_mem=$(echo $mem_info | awk '{print $3}')
mem_usage=$(awk "BEGIN {printf \"%.0f\", ($used_mem/$total_mem)*100}")






# Log to file
echo "$(date): CPU ${cpu_usage}%, Memory ${mem_usage}%" >> "$log_file"

# Output and alerts
if [[ -n "$cpu_usage" && "$cpu_usage" -gt "$CPU_LIMIT" ]]; 
	then
    	echo "CPU usage is ${cpu_usage}%. Exceeds threshold of ${CPU_LIMIT}%."
else
    	echo "CPU usage is ${cpu_usage}%."
fi

if [[ -n "$mem_usage" && "$mem_usage" -gt "$MEM_LIMIT" ]]; 
	then
    	echo "Memory usage is ${mem_usage}%. Exceeds threshold of ${MEM_LIMIT}%."
else
    	echo "Memory usage is ${mem_usage}%."
fi









