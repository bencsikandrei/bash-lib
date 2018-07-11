#!/bin/bash

set -u

source "../include/assert.bash"
source "../include/log.bash"

# Test show debug log when active
function TestLogShouldPrintWhenDebugFlagOn() {
	local __funcName=${FUNCNAME[0]}
	local __file="/tmp/${__funcName}"

	rm -fr ${__file}

	echo "Running ${__funcName}.."
	DEBUG=on

	LOGD "Log debug"  > ${__file}

	local __lc=$(wc -l ${__file} | sed 's/ .*//')

	assert "${__lc} -eq 1" 16

	rm -fr ${__file}
}

# Test show debug log when active
function TestLogShouldNotPrintWhenDebugFlagOff() {
	local __funcName=${FUNCNAME[0]}
	echo "Running ${__funcName}.."
	unset ${DEBUG}

	LOGD "Log debug"  > /tmp/${__funcName}

	local __lc=$(wc -l /tmp/${__funcName} | sed 's/ .*//')

	assert "${__lc} -eq 0" 31
}
# Main
TestLogShouldPrintWhenDebugFlagOn
TestLogShouldNotPrintWhenDebugFlagOff
