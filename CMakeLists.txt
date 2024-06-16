cmake_minimum_required(VERSION 3.27)
project(AutoHotkey)

enable_language(C CXX ASM_MASM)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(config/pcre.cmake)
include(config/auto-hotkey.cmake)
include(config/auto-hotkey-tests.cmake)
