#!/bin/bash -x

# CONSTANTS FOR THE PROGRAM
isPartTime=1;
isFullTime=2;
maxHrsInMonth=160;
empRatePerHr=20;
numberOfWorkingDays=20;

#VARIBLES
totalEmpHr=0;
totalWorkingDays=0;

function getWorkingHrs()
{
        local $empCheck=$1
        case $empCheck in
                $isFullTime)
                        empHrs=8
                        ;;
                $isPartTime)
                        empHrs=4
                        ;;
                        *)
                        empHrs=0
                        ;;
        esac
        echo $empHrs
}

function getEmpWage()
{
        local empHr=$1
echo $(($empHr*$empRatePerHr))
}

while [[ $totalEmpHrs -lt $maxHrsInMonth &&
        $totalWorkingDays -lt $numberOfWorkingDays ]]
do
        ((totalWorkingDays++))
        empCheck=$((RANDOM%3));
        empHrs="$( getWorkingHrs $empCheck )"
        totalEmpHrs=$(($totalEmpHrs + $empHrs))
        dailyWages["$totalWorkingDays"]="$( getEmpWage $empHrs )"
done

totalSalary=$(($totalEmpHrs*$empRatePerHr));
echo ${dailyWages[@]}

echo ${!dailyWages[@]}
echo ${#dailyWages[@]}
