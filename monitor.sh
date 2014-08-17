#! /bin/sh -

#  SJP 16 August 2014
#  Monitor my external IP address

# set up logfile

cd ~/mail/monitor

if (test -e data/tmp.*) then
	datafile=$(ls data/tmp.*)
else
	datafile=`mktemp --tmpdir=data`
fi

echo "datafile = $datafile"

ip=$(curl ifconfig.me/ip)
dt=$(\date  +%Y-%m-%dT%T%:z)

echo -e "$dt\t$ip" >> $datafile


