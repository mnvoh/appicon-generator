#!/bin/bash

if [ "$#" -ne 1 ] 
	then
	echo "Invalid number of arguments!"
	exit
fi

path=$1

if [ ! -f "$path" ]
	then
	echo "File not found!"
	exit
fi

filename=$(basename "$path")
name="${filename%.*}"
extension="${filename##*.}"

sizes=(20 29 40 58 60 76 80 87 120 152 167 180)

for i in ${sizes[@]}; do
	sips -Z "$i" "$path" --out "$name$i.$extension"
done