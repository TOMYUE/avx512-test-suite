#!/bin/bash

for cfile in *.c; do
  basename="${cfile%.*}"
  clang -g -o "build/AVX512F-$basename" -O3 -mavx512f -mavx512bw -lm -fms-extensions "$cfile"
done
