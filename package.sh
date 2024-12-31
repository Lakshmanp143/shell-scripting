#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "you need to be root user execute this script"
    exit 1
fi

dnf list installed | grep mysql
if [ $? -ne 0 ]; then
    echo "mysql is not installed, installing"
    
    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo "installing is failure"
        exit 1
    else
        echo "Installing is success"
    fi
else
    echo "mysql already installed"
fi