## String

## Remove a suffix from a string and return the result
function removeSuffix() {
	local __str="$1"
	local __suffix="$2"

	local __result=$(basename "${__str}" "${__suffix}")

	echo "${__result}"
}

function removePrefix() {
	echo ""
}
