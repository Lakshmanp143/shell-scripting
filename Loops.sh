#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"
USERID=(id -u)
TIMESTAMP=$(date +%F)
FOLDER_NAME="var/log/shellscript-logs"
FILE_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE_NAME="$FOLDER_NAME/$FILE_NAME-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2.....$R FAILURE $N"
        exit 1
    else 
        echo "$2.....$G success $N"
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
        "$package already.... $Y installed" 
    fi
done


