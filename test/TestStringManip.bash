#!/bin/bash

set -u

# Tested file
source "../include/assert.bash"
source "../include/string.bash"
source "../include/test.bash"

# Test remove suffix
function TestRemoveSuffixRemovesItWhenThere() {
	local __result=$(removeSuffix "main.cpp" ".cpp")

	assert_streq "${__result}" "main" 14
}

# Test when suffix not there, do nothing
function TestRemoveSuffixDoesNothingWhenNotThere() {
	local __result=$(removeSuffix "main.cpp" ".hpp")

	assert_streq "${__result}" "main.cpp" 21
}

# Test when prefix is there, remove it
function TestRemovePrefixRemovesPrefixWhenThere() {
	local __result=$(removePrefix "main.cpp" "main")

	assert_streq ".cpp" "${__result:-"_"}" 27
}

# Test when prefix isn't there, do nothing
function TestRemovePrefixDoesNothingWhenNotThere() {
	local __result=$(removePrefix "main.cpp" "hello")

	assert_streq "main.cpp" "${__result:-"_"}" 27
}

function TestReplaceAllOccurencesInString() {
	local __result=$(replaceAll "Hello, world" "Hello" "Bye")

	echo ${__result} | grep -w "Bye, world"

	assert_eq "$?" "0" 43
}

## Tests
runTest "TestRemoveSuffixRemovesItWhenThere"
runTest "TestRemoveSuffixDoesNothingWhenNotThere"
runTest "TestRemovePrefixRemovesPrefixWhenThere"
runTest "TestRemovePrefixDoesNothingWhenNotThere"

runTest "TestReplaceAllOccurencesInString"

# assert_eq 0 1 35
pass

