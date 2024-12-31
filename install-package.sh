#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "you need to be root user execute this script"
    exit 1
fi

dnf list installed | grep nginx
if [ $? -ne 0 ]; then
    echo "nginx is not installed, installing"

    dnf install nginx -y

    if [ $? -ne 0 ]; then
        echo "program is failure"
        exit 1
    else
        echo "program is success"
    fi
else
    echo "nginx already installed"
fi