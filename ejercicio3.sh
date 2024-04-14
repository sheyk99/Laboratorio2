#!/bin/bash

#Ejecutable al segundo plano 
back="$1"
$back > /dev/null &

#Consumo de CPU y memoria
#Periodicamente lo envia al archivo de registro
while [ $( pgrep -c $1 ) = 1 ]; 
do
    pid=$( pgrep $1 )
    cpu=$( ps -o %cpu= -p $pid )
    mem=$( ps -o %mem= -p $pid )
    date=$( date +"%Y-%m-%d %H:%M:%S" )
    echo "$date $cpu% $mem%" >> consumo_$1.log
    sleep 5
    
done
