#! /bin/bash


lastMac=$(arping -I vboxnet2 -c 1 192.168.58.101 | grep reply | cut -d "[" -f2 | cut -d "]" -f1)
MESSAGE=""
while true; do
	MAC=$(arping -I vboxnet2 -c 1 192.168.58.101 | grep reply | cut -d "[" -f2 | cut -d "]" -f1)
	if [ "$MAC" != "$lastMac" ]
	then
		for i in {2..6}
		do
			MESSAGE=$MESSAGE$(echo $MAC | cut -d ":" -f$i | xxd -r -p$)
		done
		echo -ne "$MESSAGE"
		MESSAGE=""
		lastMac=$MAC
	fi
done
