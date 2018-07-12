#!/bin/bash

set -u

source "../include/assert.bash"
source "../include/log.bash"
source "../include/test.bash"

# Test show debug log when active
function TestLogShouldPrintWhenDebugFlagOn() {
	DEBUG=on

	local __lc=`LOGD "Log debug" | wc -l`

	assert "${__lc} -eq 1" 16
}

# Test show debug log when active
function TestLogShouldNotPrintWhenDebugFlagOff() {
	DEBUG=off

	local __lc=`LOGD "Hello debug" | wc -l`

	assert "${__lc} -eq 0" 31
}

# Test loge shows ERR and the text
function TestLogeShouldShowErr() {
	local __myText="Hello"
	local __hasErr=`LOGE "${__myText}" | grep ERR`
	local __hasText=`LOGE "${__myText}" | grep "${__myText}"`
	assert "! -z "${__hasErr}"" 39
	assert "! -z "${__hasText}"" 39
}

# Main
runTest "TestLogShouldPrintWhenDebugFlagOn"
runTest "TestLogShouldNotPrintWhenDebugFlagOff"
runTest "TestLogeShouldShowErr"

pass
