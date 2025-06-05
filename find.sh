#!/bin/bash

# Parameters
colorR='\e[91m'
color='\e[92m'
rst='\e[0m'
scanRoot=true

# Get inputs
while getopts "f:d" opt; do
  case $opt in
    f)
      filename="$OPTARG"
      ;;
    d)
      scanRoot=false
      ;;
  esac
done

# Inspect file
if [[ -z "$filename" ]]; then
  echo -e "${color}ERROR: No file was provided${rst}"
  echo -e "Usage: $0"
  echo "Inputs:"
  echo "    -f <file name>"
  echo -e "Optional Flags:"
  echo -e "    -d (scan from current dir instead of root dir)\n"
  exit 1
fi

# Display scan info
echo -e "Searching for file: ${colorR}${filename}${rst}"
echo -e "Scan from root dir: ${colorR}${scanRoot}${color}"

# Find file
if [[ "$scanRoot" == true ]]; then
  find / -name "$filename" 2>/dev/null
else
  find . -name "$filename" 2>/dev/null
fi
