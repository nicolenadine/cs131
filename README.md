# Spotify Data Analysis Term Project 
CS 131: Processing Big-Data at San Jose State University Fall 2024

## Project Objective

Utilize Spotify API song data to find songs that can be used to build custom playlists based on specific criteria.

Demonstrate course skills in command line tools, shell scripting, and libraries for data handling/visualization in python.

**Example Queries:** Find songs with a BPM between 125-135 for a running playlist

## Dataset Information

**Original Dataset:** "World's Spotify TOP-50 playlist musicality data"  
**Source:** Kaggle.com  
**Created by user:** miquelneck  
**Original records:** ~3600  

This dataset contained the top 50 songs from 73 different countries. For our analysis, we:
1. Sorted the full dataset by popularity score in descending order
2. Determined the first 20 unique countries from this sorted list
3. Filtered the entire list to only contain rows matching one of those 20 countries
4. Used the resulting list of top 50 songs from 20 different countries for analysis

## Tools and Scripts

This project includes a set of data cleaning and analysis tools built using shell scripting and AWK:

### Data Cleaning

- **clean.sh** - Main data processing script that:
  - Removes header row (preserves for later)
  - Filters out rows containing "Global" in the Country column
  - Removes duplicate entries
  - Sorts by popularity in descending order
  - Extracts the top 20 unique countries
  - Filters the dataset to include only songs from these countries
  - Sorts the final dataset by country
  - Outputs cleaned data to "spotifyCleaned.csv"

### Statistical Analysis

A set of AWK scripts for analyzing numerical columns in the dataset:

- **average.awk** - Calculates the average value of a specified column
  - Usage: `./average.awk -v col_num=N input.csv`
  - Skips the header row and non-numeric values
  - Outputs the average of values in the specified column

- **max.awk** - Finds the maximum value in a specified column
  - Usage: `./max.awk -v col_num=N input.csv`
  - Skips the header row and non-numeric values
  - Outputs the maximum value found in the specified column

- **min.awk** - Finds the minimum value in a specified column
  - Usage: `./min.awk -v col_num=N input.csv`
  - Skips the header row and non-numeric values
  - Outputs the minimum value found in the specified column

- **mode.awk** - Calculates the mode (most frequent value) in a specified column
  - Usage: `./mode.awk -v col_num=N input.csv`
  - Skips the header row
  - Outputs the most frequently occurring value and its count

## Usage Examples

```bash
# Clean and prepare the dataset
./clean.sh spotify_data.csv

# Find the average BPM (assuming it's column 5)
./average.awk -v col_num=5 spotifyCleaned.csv

# Find songs with maximum danceability
./max.awk -v col_num=7 spotifyCleaned.csv

# Find songs with minimum energy
./min.awk -v col_num=8 spotifyCleaned.csv

# Find the most common key
./mode.awk -v col_num=12 spotifyCleaned.csv
```

## Project Applications

This toolkit enables users to:

1. Clean and filter large music datasets efficiently
2. Analyze musical features across different countries and popularity levels
3. Identify trends in popular music characteristics
4. Create customized playlists based on specific audio features (tempo, energy, danceability, etc.)

## Contributors

- Alex G.
- Aman K.
- Benjamin L.
- Nicole W

*CS 133: Processing Big-Data - San Jose State University*
