#! /bin/bash 

# SJP 5 September 2014
# just testing how to set if conditions

x=$1

echo 'square bracket'
#[ $x == 1 ] && echo 'x = 1' || echo 'x is not 1'
[ $x == 1 ] && ("$x"=2; echo 'adding 1') || echo 'x is not 1'

echo "x is now $x"

#wrong
# [ $y ] && echo "y is true" || echo "y is false"
#echo -e "y is $y\n"

#y=F

#[ $y ] && echo "y is true" || echo "y is false"
#echo "y is $y"

echo -e "\n multi line if then test"

if (test "$x" -lt $2) then
	echo "$x is less than $2"
else
	echo "$x is not less than $2"
fi

