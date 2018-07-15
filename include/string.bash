## String
if [ ! -z "${SOURCED_STRINGS_BASH+x}" ]; then return; fi
SOURCED_STRINGS_BASH=true

## Remove a suffix from a string and return the result
function removeSuffix() {
	local __str="$1"
	local __suffix="$2"

	local __result=$(basename "${__str}" "${__suffix}")

	echo "${__result}"
}

## Remove prefix from a string and return the result
function removePrefix() {
	local __str="$1"
	local __prefix="$2"

	local __result=${__str#${__prefix}}

	echo "${__result}"
}

function replaceAll() {
	local __str="$1"
	local __toReplace="$2"
	local __with="$3"

	local __result="${__str//${__toReplace}/${__with}}"

	echo ${__result}
}
