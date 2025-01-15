#!/bin/bash

# array --> we can't increase the size
# arraylist ---> we can increase the size

DATE=$(date +%Y-%m-%d-%H-%M-%S)
MOVIES=("bahubali" "daaku" "druva")
NUM1=5
NUM2=6
SUM=$(($NUM1+$NUM2))

echo "Script started executing at:: $DATE"

echo "Sum of num and num2:: $SUM"

echo "First movie:: ${MOVIES[0]}"
echo "Second movie:: ${MOVIES[1]}"
echo "Third movie:: ${MOVIES[2]}"
echo "All movies:: ${MOVIES[@]}"