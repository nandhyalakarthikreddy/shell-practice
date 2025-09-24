#!/bin/bash

echo "please enter the number"
read NUMBER

if [ $(($NUMBER % 2)) ]; then
    echo "given number is $NUMBER even number"
else
    echo "given number is $NUMBER odd number"
fi