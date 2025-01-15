#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"

USERID=$(id -u)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S )
LOGS_FOLDER="/var/log/shell-script-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1 )
LOGS_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"


if [ $USERID -ne 0 ]
then    
    echo -e "ERROR:: $B You need to be root user to execute this script $N "
    exit 1
fi

echo "Script started executing at:: $TIMESTAMP" &>>$LOGS_FILE_NAME

VALIDATE(){

if [ $1 -ne 0 ]
then
    echo -e "$2....... $R FAILURE $N "
    exit 1
else
    echo -e "$2........$G SUCCESS $N"
fi
}


for package in $@ 
do
    dnf list installed $package  &>>$LOGS_FILE_NAME
    if [ $? -ne 0 ]
    then   
        dnf install $package -y  &>>$LOGS_FILE_NAME
        VALIDATE $? "Installing $package"
    else    
        echo -e "$package already $Y ..installed $N "
    fi 
done