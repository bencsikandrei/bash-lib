## Test the parser function
set -u

source "../include/assert.bash"
source "../include/log.bash"
source "../include/test.bash"
source "../include/args_parser.bash"

# Simple test to check if parsing goes OK
function TestParserWithTwoOptionsGoesThroughAll() {
	SHORT_OPTS="vh";
	LONG_OPTS="verbose,help";

	CASE1="
	-v | --verbose )
		echo 'setting verbose'
		VERBOSE=true; shift;;
	"
	CASE2="
	-h | --help)
		echo 'setting help'
		HELP=true; shift;;
	"

	declare -A parserOptions

	parserOptions[toParse]="$@"
	parserOptions[shorts]="${SHORT_OPTS}"
	parserOptions[longs]="${LONG_OPTS}"
	parserOptions[cases]="${CASE1} ${CASE2}"

	parseArgs
}

# Simple test to check if parsing goes OK for one case
function TestParserWithTwoOptionsGoesThroughOne() {
	SHORT_OPTS="vh";
	LONG_OPTS="verbose,help";

	CASE1="
	-v | --verbose )
		echo 'setting verbose'
		VERBOSE=true; shift;;
	"
	declare -A parserOptions

	parserOptions[toParse]="$@"
	parserOptions[shorts]="${SHORT_OPTS}"
	parserOptions[longs]="${LONG_OPTS}"
	parserOptions[cases]="${CASE1}"

	parseArgs
}

# Simple test to check if parsing goes OK for no case
function TestParserWithNoOptionsStillWorks() {
	SHORT_OPTS="vh";
	LONG_OPTS="verbose,help";

	declare -A parserOptions

	parserOptions[toParse]="$@"
	parserOptions[shorts]="${SHORT_OPTS}"
	parserOptions[longs]="${LONG_OPTS}"
	parserOptions[cases]=""

	parseArgs
}

runTest "TestParserWithTwoOptionsGoesThroughAll" "--help --verbose"
runTest "TestParserWithTwoOptionsGoesThroughOne" "--verbose"
runTest "TestParserWithNoOptionsStillWorks"

pass
