#!/bin/bash

#nombre del proceso
proceso=$( ps -o comm= -p $1)
echo "nombre del proceso:" $proceso

#id del proceso 
echo "PID:" $1

#Parent process ID 
echo "Parent process ID:" $(ps -o ppid= -p $1)

#usuario propietario
echo "Usuario:" $(ps -o user= -p $1)

#uso de CPU
echo "Uso de CPU:" $(ps -o %cpu= -p $1)

#consumo de memoria
echo "Uso de memoria:" $(ps -o %mem= -p $1)

#Estado
echo "Estado del proceso:" $(ps -o stat= -p $1)

#Path del ejecutable
echo "Path del ejecutable:" $(readlink -f $proceso)



