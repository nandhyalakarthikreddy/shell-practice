#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error :: please run the script by using root user"
fi


dnf insatll mysql -y

if [ $? -ne 0 ]; then
     echo "Error :: failed to install mysql"
else
    echo "installing the mysql server"
fi