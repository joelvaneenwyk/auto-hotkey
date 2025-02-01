#include <gtest/gtest.h>

#include "../ahkversion.h"

// Demonstrate some basic assertions.
TEST(AutoHotkey, BasicAssertions) {
	// Expect two strings not to be equal.
	EXPECT_STRNE("hello", "world");
	// Expect equality.
	EXPECT_EQ(7 * 6, 42);
}

// Demonstrate some basic assertions.
TEST(AutoHotkey, Version) {
	EXPECT_STRNE("hello", AHK_VERSION);
}