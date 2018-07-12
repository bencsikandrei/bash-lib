#!/bin/bash

set -u

# Tested file
source "../include/assert.bash"
source "../include/string.bash"
source "../include/test.bash"

# Test remove suffix
function TestRemoveSuffixRemovesItWhenThere() {
	local __result=$(removeSuffix "main.cpp" ".cpp")

	assert_streq "${__result}" "main" 15
}

# Test when prefix not there, do nothing
function TestRemoveSuffixDoesNothingWhenNotThere() {
	local __result=$(removeSuffix "main.cpp" ".hpp")

	assert_streq "${__result}" "main.cpp" 24
}

function TestRemovePrefixDoesWhatItShould() {
	echo ""
}

## Tests
runTest "TestRemoveSuffixRemovesItWhenThere"
runTest "TestRemoveSuffixDoesNothingWhenNotThere"


# assert_eq 0 1 35
pass

