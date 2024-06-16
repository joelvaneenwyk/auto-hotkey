cmake_minimum_required(VERSION 3.27)
project(AutoHotkey)

enable_language(CXX ASM_MASM)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(config/pcre.cmake)
include(config/auto-hotkey.cmake)

# ----------------------------------------
# testing
# ----------------------------------------

include(FetchContent)
FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

set(test_name unit_tests)
set(sources_test
        source/tests/common_tests.cpp)
add_executable(
        ${test_name}
        ${sources_test}
)
# This define is added to prevent collision with the main.
# It might be better solved by not adding the source with the main to the
# testing target.
target_compile_definitions(${test_name} PUBLIC UNIT_TESTS)

# This allows us to use the executable as a link library, and inherit all
# linker options and library dependencies from it, by simply adding it as dependency.
set_target_properties(${test_name} PROPERTIES ENABLE_EXPORTS on)

target_link_libraries(
        ${test_name}
        GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(${test_name})

# ----------------------------------------
# packaging
# ----------------------------------------

# All install commands get the same destination. this allows us to use paths
# relative to the executable.
install(TARGETS auto_hotkey DESTINATION bin)

# Now comes everything we need, to create a package
# there are a lot more variables you can set, and some
# you need to set for some package types, but we want to
# be minimal here.
set(CPACK_PACKAGE_NAME "AutoHotkey")
set(CPACK_PACKAGE_VERSION "1.0.0")
