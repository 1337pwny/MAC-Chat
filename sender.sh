#! /bin/bash

MESSAGE="Hallo IT-Sec Meetup Kassel    "
Counter=1
MAC="00:"
for (( i=0; i<${#MESSAGE}; i++ )); do
	hexChar=$(echo "${MESSAGE:$i:1}" | xxd -l1 -p$)
	echo $hexChar
	MAC="$MAC$hexChar"
	if [ "$Counter" -gt "4" ]; then
    		ifdown enp0s8
		ip link set enp0s8 address $MAC
		ifup enp0s8
		
		
		Counter=1
		echo "$MAC"
		MAC="00:"
		sleep 5
	else
		((Counter++))
		MAC="$MAC:"
	fi
done
