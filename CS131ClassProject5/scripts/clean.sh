#!/bin/bash

# Check if a file is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File $1 not found."
    exit 1
fi

# Save column header row for later
head -n 1 "$1" > header.csv

# Temporarily remove the header row
tail -n +2 "$1" > temp.csv

# Remove the lines containing the value "Global" in the Country column 
sed '/Global/d' "$1" temp.csv > temp2.csv

# Remove duplicate rows
sort temp2.csv | uniq > temp3.csv

# Sort by popularity (6th column) in descending order by integer value
sort -t',' -k6,6nr temp3.csv > sorted.csv

#Locate the first 20 unique countries from the top of the list sorted by popularity and convert to a single comma separated string
uniq_countries=$(awk -F',' '{print $2}' sorted.csv | uniq | head -n 20 | paste -sd ',' -)

# When uncommented prints out the 20 countries that are used in the following filtering steps
# echo "$uniq_countries"

# Using the string of countries in uniq_countries, convert to an array and for each row determine if the value in the country column matches against the countries in the array, if yes keep it
awk -F',' -v countries="$uniq_countries" 'BEGIN{split(countries, array, ",")} {for (i in array) if(array[i] == $2) print}' sorted.csv > temp4.csv

# Sort final rows  by country
sort -t',' -k2 temp4.csv > sorted2.csv

# Add the header row back in to the cleaned file
cat header.csv sorted2.csv > spotifyCleaned.csv

# Remove temporary files
rm header.csv temp.csv temp2.csv temp3.csv temp4.csv sorted.csv sorted2.csv

