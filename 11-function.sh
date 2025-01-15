#!/bin/bash

USERID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
then
    echo "$2.......FAILURE"
    exit 1
else
    echo "$2........SUCCESS"
fi
}

if [ $USERID -ne 0 ]
then    
    echo "ERROR:You need to be root user to execute this script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "Mysql is not installed, installing ...wait!!!!"
    dnf install mysql -y
    VALIDATE $? "mysql installing"
else
    echo "Mysql is already installed"
fi 

dnf list installed git
if [ $? -ne 0 ]
then 
    echo "Git is not installed, installing ...wait!!!!"
    dnf install git -y
    VALIDATE $? "git installing"
else
    echo "Git is already installed"
fi 