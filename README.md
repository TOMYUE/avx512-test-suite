# AVX512 test-suite Repository

> originate from llvm-test-suite repo, strips out the AVX512 unit tests and compiles them separately.
> https://github.com/llvm/llvm-test-suite

### Structure
Unit testcase souce files lies in each subdirectory, corresponding compiled ELFs lies in each `build` directory, and ELFs directory, containing 73 testcases in total.
```
./avx512-test-suite
├── AVX512BW
│   └── build
├── AVX512BWVL
│   └── build
├── AVX512DQ
│   └── build
├── AVX512DQVL
│   └── build
├── AVX512F
│   └── build
├── AVX512VL
│   └── build
└── ELFs
```

### Usage

#### Compile and Run test
Use `compile.sh` to compile each subdirectory's source file, and use `run.sh` to run.

e.g. AVX512VL example
```shell
~/avx512-test-suite/AVX512VL
❯ ls
build           i32scatter_32.c  i64scatter_32.c   run.sh
compile.sh      i32scatter_64.c  i64scatter_64.c
i32gather_32.c  i64gather_32.c   m512_test_util.h
i32gather_64.c  i64gather_64.c   Makefile
~/avx512-test-suite/AVX512VL
❯ ./compile.sh 
mkdir: cannot create directory ‘build’: File exists
~/avx512-test-suite/AVX512VL
❯ ./run.sh 
[INFO]: Ran AVX512F-i32gather_32
PASSED
[INFO]: Ran AVX512F-i32gather_64
PASSED
[INFO]: Ran AVX512F-i32scatter_32
PASSED
[INFO]: Ran AVX512F-i32scatter_64
PASSED
[INFO]: Ran AVX512F-i64gather_32
PASSED
[INFO]: Ran AVX512F-i64gather_64
PASSED
[INFO]: Ran AVX512F-i64scatter_32
PASSED
[INFO]: Ran AVX512F-i64scatter_64
PASSED
```

#### Using personal build tool to run testcases

`run_test.sh` is offered for you to run each testcases above your own compilation system tool, like Qemu, Pin, DynamoRIO, .etc

```shell
> ./run_test.sh /home/user/Pin/pin -t inscount.so --
[INFO]: Running /home/user/avx512-test-suite/ELFs/AVX512F-abs
PASSED
[INFO]: Running /home/user/avx512-test-suite/ELFs/AVX512F-alignr
PASSED
[INFO]: Running /home/user/avx512-test-suite/ELFs/AVX512F-broadcast
PASSED
[INFO]: Running /home/user/avx512-test-suite/ELFs/AVX512F-casts
PASSED
[INFO]: Running /home/user/avx512-test-suite/ELFs/AVX512F-compress
PASSED
.......
```
