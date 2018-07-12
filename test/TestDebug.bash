#!/bin/bash

set -u

source "../include/assert.bash"
source "../include/log.bash"

# Test show debug log when active
function TestLogShouldPrintWhenDebugFlagOn() {
	local __funcName=${FUNCNAME[0]}
	local __file="/tmp/${__funcName}"

	echo "Running ${__funcName}.."
	DEBUG=on

	local __lc=`LOGD "Log debug" | wc -l`

	assert "${__lc} -eq 1" 16
}

# Test show debug log when active
function TestLogShouldNotPrintWhenDebugFlagOff() {
	local __funcName=${FUNCNAME[0]}
	echo "Running ${__funcName}.."
	DEBUG=off

	local __lc=`LOGD "Hello debug" | wc -l`

	assert "${__lc} -eq 0" 31
}

# Test loge shows ERR and the text
function TestLogeShouldShowErr() {
	local __funcName=${FUNCNAME[0]}
	echo "Running ${__funcName}.."
	local __myText="Hello"
	local __hasErr=`LOGE "${__myText}" | grep ERR`
	local __hasText=`LOGE "${__myText}" | grep "${__myText}"`
	assert "! -z "${__hasErr}"" 39
	assert "! -z "${__hasText}"" 39
}

# Main
TestLogShouldPrintWhenDebugFlagOn
TestLogShouldNotPrintWhenDebugFlagOff
TestLogeShouldShowErr
