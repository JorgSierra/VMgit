#!/bin/bash

# EJERCICIO 2

# Obtener del archivo "Personajes_lol" los siguientes datos:

# 1 - Obtener los nombres de los personajes que empieza con "N" y distinguirlos entre "Melee (M) y Ranged (R)". 
# Si alguno posee la caracteristica de "R/M" imprimirlo aparte.

cantMele=$(cat personajes_lol | grep "N" | awk '{print$2}' | sed 's_/_and_g' | grep -w M | wc -l)
cantRanged=$(cat personajes_lol | grep "N" | awk '{print$2}' | sed 's_/_and_g' | grep -w R | wc -l)
cantRandM=$(cat personajes_lol | grep "N" | awk '{print$2}' | sed 's_/_and_g' | grep -w RandM | wc -l)

#Se hace la conversion (sed) de / a "and" porque al buscar con grep R trae tanto los R como los R/M

echo " --- --- --- --- --- --- Resultados --- --- --- --- --- --- "
echo "Personajes de mele que empiezan por N: $cantMele"
echo "Personajes de range que empiezan por N: $cantRanged"
echo "Personajes de range y mele que empiezan por N: $cantRandM"

# 2 - Imprimir los primeros 7 personajes de la lista, y los ultimo 6 utilizando el comando "Shuf" anteriormente para mezclarlos.

echo "7 ultimos elementos despues de shuffle"
echo "$(cat personajes_lol | shuf | tail -n 7)"
echo ""
echo "7 primeros elementos despues de shuffle"
echo "$(cat personajes_lol | shuf | head -n 7)"

# 3 - Modificar todos los espacios por ", (coma)" del archivo y guardarlo en un nuevo que se llame "lista_personajes_csv"

#Convierte todos los espacios consecutivos en comas
#Se encuentra un problem con el personaje Twisted Fate (linea 105) ya que tiene un espacio en su nombre

cat personajes_lol | sed 's/\s/,/g' > personajes.csv

# 4 - Contabilizar cuantos personajes hay en total, cuantos hay con la caracteristica "R/M", cuantos "MELEE (M)" y cuantos "RANGED (R)"
#Este script necesita correr la parte anterior para que exista el .csv

mele=$(cat personajes.csv | awk -F"," '{print$2}' | sed 's_/_and_g' | grep -w M | wc -l)
range=$(cat personajes.csv | awk -F"," '{print$2}' | sed 's_/_and_g' | grep -w R | wc -l)
rangeAndMele=$(cat personajes.csv | awk -F"," '{print$2}' | sed 's_/_and_g' | grep -w RandM | wc -l)

echo "Total personajes de mele: $mele"
echo "Total presonajes de range: $range"
echo "Total personajes de range y mele: $rangeAndMele"

#La suma de los totales no es la misma que la cantidad de nombres en el archivo (falta 1) ya que en la columna 2
#del nombre Twisted Fate (linea 105) se encuentra la palabra Fate
