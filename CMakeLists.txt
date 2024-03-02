cmake_minimum_required(VERSION 3.27)
project(AutoHotkey)

enable_language(CXX ASM_MASM)
include(config/pcre.cmake)
include(config/auto-hotkey.cmake)

# ##############################################################################
# # testing ####################################################################
# ##############################################################################

# This is for our testing framework,
# we don't add REQUIRED because it's just for testing.
# People who might want to build the project to use it should not be required
# to install testing dependencies.
find_package(GTest)

if(GTEST_FOUND)
    add_executable(unit_tests ${sources_test} ${sources})

    # This define is added to prevent collision with the main.
    # It might be better solved by not adding the source with the main to the
    # testing target.
    target_compile_definitions(unit_tests PUBLIC UNIT_TESTS)

    # This allows us to use the executable as a link library, and inherit all
    # linker options and library dependencies from it, by simply adding it as dependency.
    set_target_properties(example PROPERTIES ENABLE_EXPORTS on)

    target_link_libraries(unit_tests PUBLIC
        ${GTEST_BOTH_LIBRARIES}
        example
    )

    target_include_directories(unit_tests PUBLIC
        ${GTEST_INCLUDE_DIRS} # doesn't do anything on linux
    )
endif()

# ##############################################################################
# # packaging ##################################################################
# ##############################################################################

# All install commands get the same destination. this allows us to use paths
# relative to the executable.
install(TARGETS auto_hotkey DESTINATION bin)

# This is basically a repeat of the file copy instruction that copies the
# resources in the build directory, but here we tell cmake that we want it
# in the package.
# install(DIRECTORY resources DESTINATION bin)

# Now comes everything we need, to create a package
# there are a lot more variables you can set, and some
# you need to set for some package types, but we want to
# be minimal here.
set(CPACK_PACKAGE_NAME "AutoHotkey")
set(CPACK_PACKAGE_VERSION "1.0.0")
