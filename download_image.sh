#!/bin/bash



CSV_FILE=$1
DEST_FOLDER=$2

# Create destination folder if it doesn't exist
mkdir -p "$DEST_FOLDER"

# Read each URL from the CSV and download the image
cut -d, -f1 "$CSV_FILE" | while read -r url; do
if [[ ! -z "$url" ]]; then
# Extract filename from URL
filename=$(basename "$url")
# Download image to destination folder
wget -q "$url" -O "$DEST_FOLDER/$filename"
echo "Downloaded $filename"
fi
done
