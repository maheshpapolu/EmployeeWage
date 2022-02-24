#!/bin/bash -x

isPartTime=1
isFullTime=2
maxHoursInMonth=100
empRatePerhr=20
numberOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

function getWorkingHrs() 
{
 case $1 in
                        $isFullTime )
                                empHrs=8
                        ;;
                        $isPartTime )
                                empHrs=4
                        ;;
                        *)
                                empHrs=0
                        ;;
        esac
}
function getEmpWage()
{
	echo $(($totalEmpHr*$empRatPerHr))
}

while [[ $totalEmpHr -lt $maxHoursInMonth
&& $totalWorkingDays -lt $numberOfWorkingDays ]]
do
	((totalWorkingDays++))
	randomcheck=$((RANDOM%3))
	getWorkingHrs $randomCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages[$totalWorkingDays]=$(($empHrs+$empRatePerhr))

done

totalsalary="$(($getEmpwage $totalEmpHr))"
echo ${dailywages[@]}


