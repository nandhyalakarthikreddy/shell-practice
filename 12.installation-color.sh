#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Error $N :: please run the script by using root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R Error :: failed to install $2 $N "
        exit 1
    else
        echo -e "$G installing the $2 server is success $N"
fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? MYSQL
else
    echo "Mysql already exists ... $Y skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo "nginx already exists ... $Y skipping $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? python3
else
    echo "python3 already exists ... $Y skipping $N"
fi