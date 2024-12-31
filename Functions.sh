#!/bin/bash
# Author: Laxman
DATE=$(date)
LOG="Mysql-installing-${DATE}"
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You need to be root user to execute this script"
    exit 1
fi

dnf list installed | grep mysql &>>$LOG
    if [ $? -ne 0 ]; then
        echo "Mqsql not installed, installing wait"
        dnf install mysql -y    
        if [ $? -ne 0 ]; then
            echo "Installing mysql is failure, Ohhh!!!"
            exit 1
        else
            echo "Installing mysql is success"
            systemctl start mysqld
            systemctl enable mysqld
            systemctl status musqld
            if [ $? -ne 0 ]; then 
                echo "mysql enabling, starting and status is failure"
            else    
                echo "mysql is running fine"
            fi
        fi
    else
        "Mysql is already installed"
    fi