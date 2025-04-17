#!/bin/bash

# example: log files
find . -type f \( -name "*.log" -o -name "*.log.*" \)

find . -type f \( -name "*.log" -o -name "*.log.*" \) -exec rm -f {} +

# Last modified time = 15 days
find . -type f \( -name "*.log" -o -name "*.log.*" \) -mtime 15 -exec rm -f {} +
