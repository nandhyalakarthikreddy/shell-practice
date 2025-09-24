#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error :: please run the script by using root user"
    exit 1
fi


dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error :: failed to install mysql"
    exit 1
else
    echo "installing the mysql server"
fi