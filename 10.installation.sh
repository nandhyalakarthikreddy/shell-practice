#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0 ]; then
    echo "Error :: please run the script by using root user"
fi