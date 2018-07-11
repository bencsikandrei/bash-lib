## Assertions
E_PARAM_ERR=98
E_ASSERT_FAILED=99

## Assert if the condition is false
function assert()         #  If condition false,
{                         #+ exit from script
                          #+ with appropriate error message.

  if [ -z $2 ]            #  Not enough parameters passed
  then                    #+ to assert() function.
	echo 	"No linenumber provided!"
    return 	$E_PARAM_ERR   #  No damage done.
  fi

  local __lineno="$2"

  if [ ! $1 ]
  then
  	echo 	"Assertion failed:  \"$1\""
    echo 	"File \"$0\", line ${__lineno}"    # Give name of file and line number.
    exit 	${E_ASSERT_FAILED}
  fi
}
