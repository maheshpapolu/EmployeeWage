#!/bin/bash  -x

isPartTime=1
isFullTime=2
totalSalary=0
empRatePerHr=20
numOfWorkingDays=20

for ((day=1; day<=$numOfWorkingDays; day++))
do
	randomcheck=$((RANDOM%3))
	case $randomcheck in
				$isFullTime )
					empHrs=8
				;;
				$isPartTime )
					empHrs=4
				;;
				*)
					empHrs=0
	esac
	salary=$(($empHrs*$empRatePerHr))
	totalSalary=$(($totalSalary+$salary))
done
