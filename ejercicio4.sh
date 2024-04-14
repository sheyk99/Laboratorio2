#!/bin/bash
#Servicios

#directorio y archivo
directorio="./monitoreo"
archivo="/cambios_monitoreo.txt"

inotifywait -m -r -e create,modify,delete --format timefmt "$directorio" | while read fecha hora directorio_archivo evento; do
    echo "[$fecha $hora] Evento $evento en $directorio_archivo" >> "$archivo"
done
