#!/bin/bash -
# SJP August 2014
# Reads logfile of IP address records created by monitor.sh
# When IP address changes it sends an email"


cd ~/mail/monitor

if (test -e data/tmp.*) then
	datafile=$(ls data/tmp.*)
else
	exit
fi


# read a whole file line by line
#i=0
#while read line
#do
#	i=$[i+1]
#	echo $i, $line
#done < $datafile 

# Get the IP address from the first line 
read firstline < $datafile

firstip=$(echo $firstline |  awk '{ print $2 }')

# sec=$(echo $firstline |  awk '{ print $1 }')

echo "First = $firstip"

lastline=$(tail -1 $datafile)

lastip=$(echo $lastline | awk '{ print $2 }')

echo "Last = $lastip"

[ "$lastip" == "$firstip" ] && echo 'match' || echo 'different'
