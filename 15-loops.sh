#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
echo " script started executed at : $(date)" | tee -a $LOGS_FILE

if [ $USERID -ne 0 ]; then
    echo -e "$R Error $N :: please run the script by using root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R Error :: failed to install $2 $N " | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$G installing the $2 server is success $N" | tee -a $LOGS_FILE
fi
}


for package in $@
do
    dnf list installed $package  &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOGS_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package is already installed...$Y SKIPPING $N"
    fi
done