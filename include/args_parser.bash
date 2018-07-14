## Args parsing functions

# Parse arguments given in an array called parserOptions
# Details on how to fill that beforehand:
#
# SHORT_OPTS="vh";
# LONG_OPTS="verbose,help";
#
# CASE1="
# -v | --verbose )
# 	echo 'setting verbose'
#  	VERBOSE=true; shift;;
# "
#
# CASE2="
# -h | --help)
# 	echo 'setting help'
#  	HELP=true; shift;;
# "
# declare -A parserOptions
#
# parserOptions[toParse]="$@"
# parserOptions[shorts]="${SHORT_OPTS}"
# parserOptions[longs]="${LONG_OPTS}"
# parserOptions[cases]="${CASE1} ${CASE2}"
function parseArgs() {
	if [[ ! -v parserOptions[@] ]]
	then
		echo "parserOptions not set!"
		return 1
	fi

	if [[ ! -v parserOptions[shorts] ]]
	then
		echo "parserOptions not set! (shorts)"
		return 1
	fi

	if [[ ! -v parserOptions[longs] ]]
	then
		echo "parserOptions not set! (longs)"
		return 1
	fi

	# Parse using getopt
	OPTS=`getopt -o "${parserOptions[shorts]}" --long "${parserOptions[longs]}" -n 'parse-options' -- ${parserOptions[toParse]}`;
	# If error occured, signal it
	if [ $? != 0 ]
	then
		echo "Failed parsing options." >&2;
		exit 1;
	fi

	# Set the options
	eval set -- "$OPTS";

	# While option left, loop
	while true
	do
  	eval "
case "$1" in
${parserOptions[cases]}
-- ) shift;
	echo '[Parser] Parsed all options'
	break ;;
* )
	echo '[Parser] (Error: Unrecognized option)'
	break ;;
 esac
"
	done
}

