if [ ! -z "${SOURCED_CLI_BASH+x}" ]; then return; fi
SOURCED_CLI_BASH=true

set -u

## Show a countdown on the screen
function countdown_sec() {
	local __timerName=$1
	local __secs=$2

	while [ ${__secs} -gt 0 ]; do
		echo -ne "[[Timer: ${__timerName}]]: ${__secs}s\033[0K\r"
		sleep 1
		: $((__secs--))
	done
}

## Show a countdown in minutes
function countdown_min() {
	local __timerName=$1
	local __mins=$2
	local __secondsInMinute=60

	countdown_sec "${__timerName}" $(( __secondsInMinute * ${__mins}  ))
}

## Show a countdown in hours
function countdown_hour() {
	local __timerName=$1
	local __hours=$2
	local __minutesInHours=60

	countdown_min "${__timerName}" $(( __minutesInHours * ${__hours}  ))
}
