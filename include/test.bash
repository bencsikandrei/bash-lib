## Test utils
source "${BASH_SOURCE%/*}/colors.bash"

## Run a specified test
function runTest() {
	local __tcName="$1"

	echo "[ ======== ] "
	echo -e "[ ${COLOR_GREEN}RUN${COLOR_NORMAL}      ] ${__tcName} .."

	eval "${__tcName}"

	local __tcVerdict=$(echo $?)

	[[ ${__tcVerdict} -eq 0 ]] && echo -e "[       ${COLOR_GREEN}OK${COLOR_NORMAL} ]"
}

## Function to say that all tests have passed, if this is reached of course
function pass() {
	## Is the test passed ?
	verdict=`echo $?`
	[[ ${verdict} -eq 0 ]] && echo -e "[ ======== ]\n[ ${COLOR_GREEN}PASSED${COLOR_NORMAL}   ]"
}

