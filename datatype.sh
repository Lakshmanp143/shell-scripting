#!/bin/bash


num1=$1
num2=$2
TIMESTAMP=$(date)
SUM=$((num1+num2))
echo "Script executed at: ${TIMESTAMP}"
echo "Sum of num1 and num2 is: ${SUM}"