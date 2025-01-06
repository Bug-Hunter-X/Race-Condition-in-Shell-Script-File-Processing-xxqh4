#!/bin/bash

# This script attempts to process files in a directory, but it has a subtle error.

find . -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' file; do
  # Attempt to process each file
  echo "Processing: $file"
  # The error is in this line
  grep "error" $file > /dev/null 2>&1
  if [[ $? -eq 0 ]]; then
    echo "Error found in $file"
  fi
  # The next line should add a delay to make the error evident
  sleep 0.1
done