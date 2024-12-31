#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then 
    echo "you need to be root user to execute this script"
    exit 1
fi

yum list installed | grep mysql

if [ $? -ne 0 ]; then 
    echo "mysql is not installed, installing"
    exit 0

    yum install mqsql -y
    if [ $? -ne 0 ]; then
        echo "installing mysql failed"
        exit 1
    else
        echo "mysql install success"
    fi

else
    echo "mysql already installed"
fi