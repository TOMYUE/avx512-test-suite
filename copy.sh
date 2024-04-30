#!/bin/bash

BASE_DIR=$PWD

SOURCE_DIRS=("AVX512BW" "AVX512F" "AVX512BWVL" "AVX512VL" "AVX512DQ" "AVX512DQVL")

DESTINATION_DIR=$PWD/ELFS

mkdir -p $DESTINATION_DIR

# copy the ELF under AVX512<xxx>/build/* into the EXE directory

for dir in "$BASE_DIR/${SOURCE_DIRS[@]}"; do
    if [ -d "$dir/build" ]; then
        cp -v "$dir/build/"* "$DESTINATION_DIR"
    else
        echo "Directory $dir/build does not exist"
    fi
done
