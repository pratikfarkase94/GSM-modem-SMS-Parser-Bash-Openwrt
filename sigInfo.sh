#!/bin/bash

	a="0"
	comgt sig > siginfo.txt
	echo $(grep -Eo '[0-9\.]+' siginfo.txt) > number.txt
	var=$(awk '{ print $1 }' number.txt)
	echo -e "\nSignal Strength is $var"
        sum=$((var + a))
	if [[ "$var" -ge 20 && $var -le 30 ]];
	then
	echo -e "SIGNAL STRENGTH IS "EXCELLENT"\n"
	elif [[ $var -ge 15 && $var -le 19 ]];
        then
	echo -e "SIGNAL STRENGTH IS "GOOD"\n"
	elif [[ $var -ge 10 && $var -le 14 ]];
	then
	echo -e "SIGNAL STRENGTH IS "OK"\n"	
	elif [[ $var -ge 2 && $var -le 9 ]];
	then
	echo -e "SIGNAL STRENGTH IS "MARGINAL"\n"
	else
	echo -e "UNABLE TO DETERMINE SIGNAL STRENGTH\n"
	fi
	#rm siginfo.txt	number.txt

