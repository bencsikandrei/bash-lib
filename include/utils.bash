## Utility functions

## This script should be sourced not executed
function include_guard() {
	if [ "${BASH_SOURCE[0]}" -ef "$0" ]
	then
		echo "Hey, you should source this script, not execute it!"
		exit 1
	fi
}

include_guard

