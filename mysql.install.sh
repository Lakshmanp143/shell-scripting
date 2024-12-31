#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You need to be root to execute this script."
    exit 1
fi

# Check if MySQL server is installed
dnf list installed | grep -q mysql-server
if [ $? -ne 0 ]; then
    echo "MySQL is not installed. Installing..."
    dnf install mysql-server -y

    if [ $? -ne 0 ]; then
        echo "Installation failed."
        exit 1
    else
        echo "MySQL installation successful."
    fi
else
    echo "MySQL is already installed."
fi
