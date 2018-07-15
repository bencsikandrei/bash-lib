# Example 1
# Get arguments like: help, verbose, address, etc..

source "../include/args_parser.bash"

function showHelp() {
	echo "This shows the help"
	echo -e "\tUse parameters to see how they are parserd."
	echo -e "\tUser --help to print this and exit"
}

SHORT_OPTS="vhs:";
LONG_OPTS="verbose,help,ssh:"

CASE1="
	-v | --verbose )
 	echo 'setting verbose';
	echo '$@'
  	VERBOSE=true;
	shift;
	echo '$@'
	;;
"

SHOW_HELP="
	-h | --help )
	showHelp;
	exit 0;;
"

SSH_TO_USE="
	-s | --ssh )
	echo '$@';
	WSSH='$2';
	shift 2;;
"

declare -A parserOptions

parserOptions[toParse]="$@"
parserOptions[shorts]="${SHORT_OPTS}"
parserOptions[longs]="${LONG_OPTS}"
parserOptions[cases]="${CASE1} ${SHOW_HELP} ${SSH_TO_USE}"

## Declare some variables
VERBOSE=false
WSSH="ssh"

parseArgs

if [ ${VERBOSE} == "true" ]
then
	echo "Verbose mode is on."
fi

echo "${WSSH}"
