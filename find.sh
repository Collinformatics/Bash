#!/bin/bash

scanRoot=true

# Get inputs
while getopts "f:d" opt; do
  case $opt in
    f)
      filename=$OPTARG
      ;;
    d)
      scanRoot=false
      ;;
  esac
done

# Inspect file
if [[ -z $filename ]]; then
  echo -e "${color}ERROR: No file was provided"
  echo -e "Usage: $0"
  echo "Inputs:"
  echo "    -f <file name>"
  echo "Optional Flags:"
  echo -e "    -d (scan from current dir (not root dir))\n"
  exit 1
fi

# Display scan info
echo Searching for file: "$filename"
echo Scan from root dir: "$scanRoot"

# Find file
if [[ $scanRoot == true ]]; then
  find / -name "$filename" 2>/dev/null
else
  find . -name "$filename" 2>/dev/null
fi
