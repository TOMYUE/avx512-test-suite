cmake_minimum_required(VERSION 3.12)
project(AVX512F LANGUAGES C)

# set default compiler to clang
set(CMAKE_CXX_COMPILER /usr/bin/clang)

# set compiler flag
add_compile_options(-g -mavx512f -lm -fms-extensions)

# get all C source file under current directory
file(GLOB_RECURSE SRC_FILES "${CMAKE_CURRENT_SOURCE_DIR}/*.c")

# iterating over all testcase C source file in AVX512F directory and creat corresponding ELF
foreach(SOURCE_FILE ${SRC_FILES})
    # get filename without file suffix
    get_filename_component(FILE_NAME ${SOURCE_FILE} NAME_WE)
    # create an executable file with the naming format AVX512F-<original C program name>.
    add_executable(AVX512F-${FILE_NAME} ${SOURCE_FILE})
    # link math lib
    target_link_libraries(AVX512F-${FILE_NAME} m)
endforeach()
