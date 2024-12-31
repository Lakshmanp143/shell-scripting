#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "you need to be root user execute this script"
    exit 1
fi

dnf list installed mysql -y
if [ $? -ne 0 ]; then

    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo "program is failure"
    else
        echo "program is success"
    fi
else
    echo "myqsl already installed"
fi