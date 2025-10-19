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

SOURCE_DIR=/home/ec2-user/find_practice/logs
if [ ! -d $SOURCE_DIR ]; then
    echo -e "Error :: Source file path is does not exist"
    exit 1
fi

FILES_TO_DELETED=$(find $SOURCE_DIR -name "*.log" -type f -mtime 75)

while IFS= read -r $filepath
do
    echo "Deleting the files: $filepath"
    rm -rf $filepath
    echo "Deleted the files: $filepath"
done <<< $FILES_TO_DELETED