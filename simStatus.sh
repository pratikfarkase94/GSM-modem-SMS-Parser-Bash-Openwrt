#!/bin/bash
	
	echo -e "\n"	
	echo -e "Checking SIM CARD status\n"	
	comgt > siminfo.txt
	if grep -w -q "ERROR" siminfo.txt; then                        
        echo -e "SIM NOT INSERTED\n"
	elif grep -w -q "Registered" siminfo.txt; then
	echo -e "SIM DETECTED, INFO -->\n"
	comgt
	else
	echo -e "UNABLE TO DETERMINE SIM STATUS\n"
	fi
	#rm siminfo.txt

