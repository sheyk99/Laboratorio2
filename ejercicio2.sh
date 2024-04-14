#!/bin/bash

#ejecuta el path
$2 > /dev/null &

#registra el pid y el estado
#revisa si ha cambiado el estado
while true; do
	pid=$( pgrep $1 )
	estado=$( ps -o stat= -p $pid )
	
	if [ $( pgrep -c $1 ) = 2 ]; then
		$2 >/dev/null &
	else
		echo "Estado": $estado
	fi
	sleep 10
done

