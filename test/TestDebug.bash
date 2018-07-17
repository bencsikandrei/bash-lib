#!/bin/bash

set -u

source "../include/assert.bash"
source "../include/log.bash"
source "../include/test.bash"

# Test show debug log when active
function TestLogShouldPrintWhenDebugFlagOn() {
	DEBUG=on

	local __lc=`LOGD "Log debug" | wc -l`

	ASSERT "${__lc} -eq 1" ${LINENO}
}

# Test show debug log when active
function TestLogShouldNotPrintWhenDebugFlagOff() {
	DEBUG=off

	local __lc=`LOGD "Hello debug" | wc -l`

	ASSERT "${__lc} -eq 0" ${LINENO}
}

# Test loge shows ERR and the text
function TestLogeShouldShowErr() {
	local __myText="Hello"
	local __hasErr=`LOGE "${__myText}" | grep ERR`
	local __hasText=`LOGE "${__myText}" | grep "${__myText}"`
	ASSERT "! -z "${__hasErr}"" ${LINENO}
	ASSERT "! -z "${__hasText}"" ${LINENO}
}

# Test logw shows WRN and the text
function TestLogeShouldShowWrn() {
	local __myText="Hello"
	local __hasWrn=`LOGW "${__myText}" | grep WRN`
	local __hasText=`LOGW "${__myText}" | grep "${__myText}"`

	ASSERT "! -z "${__hasWrn}"" ${LINENO}
	ASSERT "! -z "${__hasText}"" ${LINENO}
}

# Test logi shows INF and the text
function TestLogeShouldShowInf() {
	local __myText="Hello"
	local __hasInf=`LOGI "${__myText}" | grep INF`
	local __hasText=`LOGI "${__myText}" | grep "${__myText}"`

	ASSERT "! -z "${__hasInf}"" ${LINENO}
	ASSERT "! -z "${__hasText}"" ${LINENO}
}

# Main
runTest "TestLogShouldPrintWhenDebugFlagOn"
runTest "TestLogShouldNotPrintWhenDebugFlagOff"
runTest "TestLogeShouldShowErr"
runTest "TestLogeShouldShowWrn"
runTest "TestLogeShouldShowInf"
pass
