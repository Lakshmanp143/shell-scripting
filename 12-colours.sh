#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"

USERID=$(id -u)
if [ $? -ne 0 ]
then    
    echo -e "ERROR:: $B You need to be root user to execute this script $N "
    exit 1
fi
VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "$2....... $R FAILURE $N "
    exit 1
else
    echo -e "$2........$G SUCCESS $N"
fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo -e " $G Mysql is not installed, installing ...wait!!!! $N "
    dnf install mysql -y
    VALIDATE $? "mysql installing"
else
    echo -e "Mysql is already $Y installed $N "
fi 

dnf list installed git
if [ $? -ne 0 ]
then 
    echo "Git is not installed, installing ...wait!!!!"
    dnf install git -y
    VALIDATE $? "git installing"
else
    echo -e "Git is already $Y installed  $N "
fi 