#! /bin/bash -

#  SJP 16 August 2014
#  Monitor my external IP address


cd ~/mail/monitor

# set up logfile
if (test -e data/tmp.*) then
	datafile=$(ls data/tmp.*)
	newfile=0
else
	datafile=`mktemp --tmpdir=data`
	newfile=1
fi

ip=$(curl ifconfig.me/ip)
[ ${#ip} = 0 ] && exit 1    # Could also do [ -z $ip ]
dt=$(\date  +%Y-%m-%dT%T%:z)

# either write date + IP to new file or compare IPs
# write date and IP address to file but delete if it's a dud
if (test "$newfile" -eq 1) then
	echo -e "$dt\t$ip" > $datafile
 #	[ "$ip" == "Timed out" ] && rm $datafile

else	# datafile already exists, so compare
	read line < $datafile
	oldip=$(echo $line | awk '{print $2 }')
	if (test "$ip" != "$oldip") then
		. notifynewip.sh
		rm $datafile
	fi
fi






