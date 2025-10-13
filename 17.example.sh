#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Failed to install try using root user"
else 
    echo "successfully installed "