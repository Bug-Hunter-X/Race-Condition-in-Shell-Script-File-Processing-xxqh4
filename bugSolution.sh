#!/bin/bash

# This script is a corrected version of the previous script.
# It avoids the race condition by correctly handling the grep command's exit code.

find . -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' file; do
  # Attempt to process each file
  echo "Processing: $file"
  # The solution is in this block:
  if grep "error" "$file" > /dev/null 2>&1; then
    # check the exit status of grep here
    if [[ $? -eq 0 ]]; then
      echo "Error found in $file"
    fi
  fi
  # The next line should add a delay to make the error evident
  sleep 0.1
done