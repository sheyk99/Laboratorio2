#!/bin/bash

$2 &
sleep 6
pid=$( pgrep $1 )
echo "PID:" $pid
estado=$(ps -o stat= -p $pid)
echo "Estado:" $estado
while true; do
	if [ $(ps -o stat= -p $pid) = $estado ]; then
        echo "Estado:" $estado
	elif [ $(ps -o stat= -p $pid) != $estado ]; then
		if [ [$(ps -o stat= -p $pid)] != [ "Sl+" || "Rl+" ] ]; then
			$2 &
		else
	    	echo "Cambio en estado:" $(ps -o stat= -p $pid)
		fi
	fi
	sleep 10	
done
