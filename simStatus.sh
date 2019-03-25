#!/bin/bash
# Run this file as root@Openwrt:# bash simStatus.sh
# Authored by - Pratik Farkase
	
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

