#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e " $R Error :: please run the script by using root user $N "
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R Error :: Failed to install $2 server $N"
        exit 1
    else
        echo "$G installing $2 server $N"
    fi
}

dnf install mysql -y
VALIDATE $? mysql

dnf install nginx -y
VALIDATE $? ngnix