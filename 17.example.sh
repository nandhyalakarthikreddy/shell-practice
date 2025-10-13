#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error :: please run the script by using root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error :: Failed to install $2 server"
    else
        echo "installing $2 server"
    fi
}

dnf install mysql -y
VALIDATE $? mysql

dnf install nginx -y
VALIDATE $? ngnix