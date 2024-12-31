#!/bin/bash
# Author: laxman
# Practicing the shell-scripting for automating the usual work
num1=$1
num2=$2
TIMESTAMP=$(date +%F)
SUM=$((num1+num2))
echo "Script executed at: ${TIMESTAMP}"
echo "Sum of num1 and num2 is: ${SUM}"


