#!/bin/bash -x

isPartTime=1
isFullTime=2
empRatePerHr=20
randomcheck=$((RANDOM%3))

if [ $isFullTime -eq $randomcheck ]
then
     empHrs=8
elif [ $isPartTime -eq $randomcheck ]
then
     empHrs=4
else
     empHrs=0
fi
salary=$(($empHrs*$empRatePerHr))
