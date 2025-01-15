#!/bin/bash


USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR: You need to be root user to execute this script"
    exit 1
fi

dnf install list installed | grep mysql
if [ $? -ne 0 ]
then
    echo "Mysql not intalled, installing ....wait!!!!"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql installing FAILURE"
        exit 1
    else
        echo "mysql installing SUCCESS"
    fi
else
    echo "mysql already installed ...SKIPPING"
fi