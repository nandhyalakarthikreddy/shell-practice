#!/bin/bash

number1=100
number2=200
name=devops
sum=$(($number1+$number2+$name))
echo "the total sum is: ${sum}"

list=("linux" "karthik" "python" "devops")
echo "all leaders:${list[@]}"