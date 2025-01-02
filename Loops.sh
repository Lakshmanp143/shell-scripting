#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FOLDER="var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2.....$R FAILURE $N"
        exit 1
    else 
        echo -e "$2.....$G success $N"
    fi
}

echo " Script started executing at: $TIMESTAMP"  &>>$LOG_FILE_NAME

if [ USERID -NE 0 ]; then
    echo " You need to be root user to execute thi sscript"
    exit 1
fi

for package in $@ 
do
    dnf list installed $package &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]; then
        dnf install $package -y  &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $package"
    else
        echo -e "$package already.... $Y installed" 
    fi
done


