#!/bin/bash

number=$1

if [ $number -lt 10 ]; then
    echo "given number is $number less than 10"
elif [ $number -eq 10 ]; then
    echo "given number is $number equal to 10"
else
    echo "given number is $number greater than 10"
fi