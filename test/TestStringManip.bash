#!/bin/bash

set -u

# Tested file
source "../include/assert.bash"
source "../include/string.bash"
source "../include/test.bash"

# Test remove suffix
function TestRemoveSuffixRemovesItWhenThere() {
	local __result=$(removeSuffix "main.cpp" ".cpp")

	ASSERT_STREQ "${__result}" "main" 14
}

# Test when suffix not there, do nothing
function TestRemoveSuffixDoesNothingWhenNotThere() {
	local __result=$(removeSuffix "main.cpp" ".hpp")

	ASSERT_STREQ "${__result}" "main.cpp" 21
}

# Test when prefix is there, remove it
function TestRemovePrefixRemovesPrefixWhenThere() {
	local __result=$(removePrefix "main.cpp" "main")

	ASSERT_STREQ ".cpp" "${__result:-"_"}" 27
}

# Test when prefix isn't there, do nothing
function TestRemovePrefixDoesNothingWhenNotThere() {
	local __result=$(removePrefix "main.cpp" "hello")

	ASSERT_STREQ "main.cpp" "${__result:-"_"}" 27
}

# Test all replacements are good when more than one occurence present
function TestReplaceAllOccurencesInString() {
	local __result=$(replaceAll "Hello, world, Hello" "Hello" "Bye")

	local __line=`echo ${__result} | grep -w "Bye, world, Bye"`

	ASSERT_EQ "$?" "0" 43
}

# Test that it does nothing when not in there
function TestReplaceAllDoesNothingWhenNotThere() {
	local __original="Hello, world!"
	local __result=$(replaceAll "Hello, world" "Bye" "Bye")

	local __line=$(echo ${__result} | grep -w "${__original}")

	ASSERT_EQ "$?" "0" 43
}

## Tests
runTest "TestRemoveSuffixRemovesItWhenThere"
runTest "TestRemoveSuffixDoesNothingWhenNotThere"
runTest "TestRemovePrefixRemovesPrefixWhenThere"
runTest "TestRemovePrefixDoesNothingWhenNotThere"
runTest "TestReplaceAllOccurencesInString"
runTest "TestReplaceAllDoesNothingWhenNotThere"

pass

