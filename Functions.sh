#!/bin/bash
# Author: Laxman
DATE=$(date +%F)
LOG="Mysql-installing-${DATE}.log"
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You need to be root user to execute this script."
    exit 1
fi

dnf list installed | grep mysql-server &>>$LOG
    if [ $? -ne 0 ]; then
        echo "mysql-server not installed, installing wait!!!"
        dnf install mysql-server -y    &>>$LOG
        if [ $? -ne 0 ]; then
            echo "MySQL installation failed, check the log at $LOG for details."
            exit 1
        else
            echo "Installing mysql-server is succeeded."
            systemctl start mysqld   &>>$LOG
            systemctl enable mysqld  &>>$LOG
            systemctl status mysqld  &>>$LOG
            if [ $? -ne 0 ]; then 
                echo "Failed to start and enable mysql-server, check the log at $LOG for details."
            else    
                echo "mysql-server is running fine."
            fi
        fi
    else
        "Mysql is already installed"
    fi