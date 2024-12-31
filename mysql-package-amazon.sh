#!/bin/bash

# Check if the script is run as root
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You need to be the root user to execute this script."
    exit 1
fi

# Check if MySQL is installed
dnf list installed | grep -q mariadb10
if [ $? -ne 0 ]; then
    echo "MySQL is not installed, proceeding with installation."

    # Update the package cache
    dnf update -y

    # Install MySQL
    sudo dnf install mariadb105 -y

    # Check if the installation was successful
    if [ $? -ne 0 ]; then
        echo "MySQL installation failed. Exiting."
        exit 1
    else
        echo "MySQL installation succeeded."

        # Enable and start the MySQL service
        systemctl enable mysqld
        systemctl start mysqld

        if [ $? -ne 0 ]; then
            echo "Failed to start MySQL service. Please check manually."
            exit 1
        else
            echo "MySQL service is up and running."
        fi
    fi
else
    echo "MySQL is already installed."
fi
