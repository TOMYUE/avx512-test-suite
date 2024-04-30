#!/bin/bash

# Change to build directory
cd build 

# Loop through all files
for exec in *; do

  # Check if file is executable
  if [[ -x $exec ]]; then

    # Print output filename 
    echo -e "\033[32m[INFO]: Ran $exec\033[0m" 

    # Run executable
    ./$exec

  fi

done