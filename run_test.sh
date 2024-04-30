#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <executable_with_options> [--]"
    exit 1
fi

CMD="$@"

ELF_DIR="$PWD/ELFS"

if [ ! -d "$ELF_DIR" ]; then
    echo "ELFS directory does not exist."
    exit 1
fi

for elf_file in "$ELF_DIR"/*; do
    echo "[INFO]: Running $elf_file"
    $CMD $elf_file
done
