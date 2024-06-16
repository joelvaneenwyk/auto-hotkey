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
target_compile_features(${test_name} PRIVATE cxx_std_14)

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
