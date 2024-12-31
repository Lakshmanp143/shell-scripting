#!/bin/bash
# Author: Laxman
DATE=$(date +%F)
LOG="Mysql-installing-${DATE}.log"
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You need to be root user to execute this script"
    exit 1
fi

dnf list installed | grep mysql &>>$LOG
    if [ $? -ne 0 ]; then
        echo "Mqsql not installed, installing wait"
        dnf install mysql -y    &>>$LOG
        if [ $? -ne 0 ]; then
            echo "MySQL installation failed."
            exit 1
        else
            echo "Installing mysql is succeeded"
            systemctl start mysql   &>>$LOG
            systemctl enable mysql  &>>$LOG
            systemctl status mysql  &>>$LOG
            if [ $? -ne 0 ]; then 
                echo "Failed to start and enable MySQL."
            else    
                echo "mysql is running fine"
            fi
        fi
    else
        "Mysql is already installed"
    fi