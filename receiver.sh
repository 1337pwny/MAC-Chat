#! /bin/bash



#function receiveSingle {
	MAC=$(arping -I wlp1s0 -c 1 192.168.88.1 | grep reply | cut -d "[" -f2 | cut -d "]" -f1)
	MESSAGE=""
	for i in {1..6}
	do
		MESSAGE=$MESSAGE$(echo $MAC | cut -d ":" -f$i | xxd -r -p$)
	done
	echo $MESSAGE
#}	
