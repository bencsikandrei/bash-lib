#!/bin/bash

set -u

source "../include/assert.bash"
source "../include/log.bash"
source "../include/test.bash"

# Test show debug log when active
function TestLogShouldPrintWhenDebugFlagOn() {
	DEBUG=on

	local __lc=`LOGD "Log debug" | wc -l`

	ASSERT "${__lc} -eq 1" 16
}

# Test show debug log when active
function TestLogShouldNotPrintWhenDebugFlagOff() {
	DEBUG=off

	local __lc=`LOGD "Hello debug" | wc -l`

	ASSERT "${__lc} -eq 0" 31
}

# Test loge shows ERR and the text
function TestLogeShouldShowErr() {
	local __myText="Hello"
	local __hasErr=`LOGE "${__myText}" | grep ERR`
	local __hasText=`LOGE "${__myText}" | grep "${__myText}"`
	ASSERT "! -z "${__hasErr}"" 32
	ASSERT "! -z "${__hasText}"" 33
}

# Test logw shows WRN and the text
function TestLogeShouldShowWrn() {
	local __myText="Hello"
	local __hasWrn=`LOGW "${__myText}" | grep WRN`
	local __hasText=`LOGW "${__myText}" | grep "${__myText}"`

	ASSERT "! -z "${__hasWrn}"" 42
	ASSERT "! -z "${__hasText}"" 43
}

# Test logi shows INF and the text
function TestLogeShouldShowInf() {
	local __myText="Hello"
	local __hasInf=`LOGI "${__myText}" | grep INF`
	local __hasText=`LOGI "${__myText}" | grep "${__myText}"`

	ASSERT "! -z "${__hasInf}"" 42
	ASSERT "! -z "${__hasText}"" 43
}

# Main
runTest "TestLogShouldPrintWhenDebugFlagOn"
runTest "TestLogShouldNotPrintWhenDebugFlagOff"
runTest "TestLogeShouldShowErr"
runTest "TestLogeShouldShowWrn"
runTest "TestLogeShouldShowInf"
pass
