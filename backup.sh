#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"


TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S )
LOGS_FOLDER="/home/ec2-user/shell_script-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1 )
LOGS_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user numberof days not provided it will take default as 14 days


USAGE(){
    echo -e " $R USAGE:: $N backup.sh <SOURSE_DIR> <DEST_DIR> <DAYS(optional)> "
    exit 1
}

if [ $# -lt 2 ]
then    
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR Does not exist...Please check"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo -e "$DEST_DIR Does not exist...Please check"
    exit 1
fi 
mkdir -p /home/ec2-user/shell_script-logs

echo "Script started executing at:: $TIMESTAMP" &>>$LOGS_FILE_NAME


FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)