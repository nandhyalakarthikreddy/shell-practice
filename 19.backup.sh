#!/bin/bash
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
