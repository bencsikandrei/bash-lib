## Assertions

E_PARAM_ERR=98
E_ASSERT_FAILED=99

source "${BASH_SOURCE%/*}/colors.bash"

## Assert if the condition is false
function assert()
{
  if [ -z $2 ]
  then
	echo 	"No linenumber provided!"
    return 	${E_PARAM_ERR}
  fi

  local __lineno="$2"

  if [ ! $1 ]
  then
  	echo -e	"Assertion ${COLOR_RED}FAILED${COLOR_NORMAL}:  \"$1\""
    echo 	"File \"$0\", line ${__lineno}"
	echo -e "[      ${COLOR_RED}NOK${COLOR_NORMAL} ]"
    exit 	${E_ASSERT_FAILED}
  fi
}

## Assert for equality
function assert_eq()
{
	if [ ! $# -eq 3 ]
	then
		echo "Not enough params provided!"
		return ${E_PARAM_ERR}
	fi

	local __one="$1"
	local __two="$2"
	local __lineno="$3"

	assert "$1 -eq $2" $3
}

## Assert for non equality
function assert_ne()
{
	if [ ! $# -eq 3 ]
	then
		echo "Not enough params provided!"
		return ${E_PARAM_ERR}
	fi

	local __one="$1"
	local __two="$2"
	local __lineno="$3"

	assert "! $1 -eq $2" $3
}

## Assert for string equality
function assert_streq()
{
	if [ ! $# -eq 3 ]
	then
		echo "Not enough params provided!"
		return ${E_PARAM_ERR}
	fi

	local __one="$1"
	local __two="$2"
	local __lineno="$3"

	assert "$1 == $2" $3
}

## Assert for string inequality
function assert_strne()
{
	if [ ! $# -eq 3 ]
	then
		echo "Not enough params provided!"
		return ${E_PARAM_ERR}
	fi

	local __one="$1"
	local __two="$2"
	local __lineno="$3"

	assert "! $1 == $2" $3
}

