#!/bin/bash
set -euo pipefail

# Pull the latest changes from the remote repository
git checkout main
git pull

# Get the current date and time formatted as YYYYMMDD_HHMMSS
timestamp=$(date +"%Y%m%d_%H%M%S")

# Define the publish directory with the timestamp
publish_dir="bin/Deploy/publish_$timestamp"

# Run the dotnet publish command with the specified output directory
rm -f *.sln
mkdir -p $publish_dir
dotnet publish -c Release -r linux-x64 --self-contained true -p:PublishSingleFile=true -o $publish_dir

# Back to the dev branch
# git checkout dev
