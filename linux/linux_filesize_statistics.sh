#!/bin/bash

FILES="*.sql"

# Get file sizes and names into a temporary file
find . -type f -name "$FILES" -printf "%s %p\n" > file_sizes.txt

# Calculate min, max, average, median
min_size=$(awk '{print $1}' file_sizes.txt | sort -n | head -n 1)
max_size=$(awk '{print $1}' file_sizes.txt | sort -n | tail -n 1)
avg=$(awk '{ total += $1; count++ } END { print total/count }' file_sizes.txt)
median=$(awk '{ a[NR] = $1 } END { if (NR % 2 == 1) { print a[(NR+1)/2] } else { print (a[NR/2] + a[NR/2 + 1]) / 2 } }' file_sizes.txt)

# Total number of lines
total=$(wc -l < file_sizes.txt)

# Sort file sizes for accurate percentile calculation
sorted_sizes=($(awk '{print $1}' file_sizes.txt | sort -n))

# Adjust percentiles based on sorted sizes
p90=${sorted_sizes[$((total * 90 / 100 - 1))]}
p95=${sorted_sizes[$((total * 95 / 100 - 1))]}
p99=${sorted_sizes[$((total * 99 / 100 - 1))]}

# Output results
echo "Total Count: $total files"
echo "Min Size: $min_size bytes"
echo "Max Size: $max_size bytes"
echo "Average Size: $avg bytes"
echo "Median Size: $median bytes"
echo "90th Percentile Size: $p90 bytes"
echo "95th Percentile Size: $p95 bytes"
echo "99th Percentile Size: $p99 bytes"

# Display file names for min, max, and percentiles
echo -e "\nFiles with Min Size:"
awk -v min="$min_size" '$1 == min { print $0 }' file_sizes.txt

echo -e "\nFiles with Max Size:"
awk -v max="$max_size" '$1 == max { print $0 }' file_sizes.txt

echo -e "\nFiles with 90th Percentile Size:"
awk -v p90="$p90" '$1 == p90 { print $0 }' file_sizes.txt

echo -e "\nFiles with 95th Percentile Size:"
awk -v p95="$p95" '$1 == p95 { print $0 }' file_sizes.txt

echo -e "\nFiles with 99th Percentile Size:"
awk -v p99="$p99" '$1 == p99 { print $0 }' file_sizes.txt