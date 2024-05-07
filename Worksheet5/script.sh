#!/bin/bash

input="$1"

awk -F',' '($8 == "United States")' "$input" >> onlyUS.csv

rows=()
while IFS= read row; 
do
  rows+=("$row")
done < <(cat onlyUS.csv)

mkdir -p "United States"

for row in "${rows[@]}"
do
   category=$(echo "$row" | awk -F',' '{print $5}')
   echo "$row" >> "United States/${category}.txt"
done




