cmake_minimum_required(VERSION 3.27)
project(auto_hotkey)

enable_language(CXX)
enable_language(C)
set(CMAKE_CXX_STANDARD 17)

include(config/pcre.cmake)
include(config/auto-hotkey.cmake)
