#!/bin/bash

mkdir build

for cfile in *.c; do
  basename="${cfile%.*}"
  clang -g -o "build/AVX512F-$basename" -O3 -mavx512f -mavx512bw -mavx512dq -mavx512vl -lm -fms-extensions "$cfile"
done
