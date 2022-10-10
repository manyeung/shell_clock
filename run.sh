#!/usr/bin/bash

char=$1
flag=$((2#000))

clock_pointer(){
	s=$((10#$1))
	f=$2
	i=$s
	c=''

	if [ $(($flag & $f)) -eq $f ]
	then
		i=$((60 - $i))
	fi

	for j in $(seq 1 $i)
	do
		c=$c$char
	done

	if [ $s -eq 59 ]
	then
		flag=$(($flag ^ $f))
	fi

	echo "$c $s"
}

while [ 1 ]
do
	clear
	clock_pointer `date +%H` $((2#100))
	clock_pointer `date +%M` $((2#010))
	clock_pointer `date +%S` $((2#001))
	sleep 1
done

