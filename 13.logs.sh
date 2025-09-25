#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="var/log/shell-script"
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

dnf list installed mysql &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOGS_FILE
    VALIDATE $? MYSQL
else
    echo -e "Mysql already exists ... $Y skipping $N"
fi

dnf list installed nginx &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOGS_FILE
    VALIDATE $? nginx
else
    echo -e "nginx already exists ... $Y skipping $N"
fi

dnf list installed python3 &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOGS_FILE
    VALIDATE $? python3
else
    echo -e "python3 already exists ... $Y skipping $N"
fi

