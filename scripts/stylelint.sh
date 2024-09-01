#!/bin/bash

# Find all .scss files in the 'projects' directory and store the result in the 'files' variable
files=$(find projects -name '*.scss')

# Check if any SCSS files were found
if [ -n "$files" ]; then
  # If SCSS files exist, run stylelint on all .scss files inside the 'projects' directory using npx
  npx stylelint "projects/**/*.scss"
else
  # If no SCSS files are found, output a message indicating that stylelint will be skipped
  echo "No SCSS files found in the projects directory, skipping stylelint."
fi
