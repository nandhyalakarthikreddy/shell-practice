#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error :: please run the script by using root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error :: failed to install $2"
        exit 1
    else
        echo "installing the $2 server"
fi
}

dnf install mysql -y
VALIDATE $? MYSQL

dnf install nginx -y
VALIDATE $? nginx

dnf install python3 -y
VALIDATE $? python3
