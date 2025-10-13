#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error :: please run the script by using root user"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "Fialed to install "
else 
    echo "successfully installed"