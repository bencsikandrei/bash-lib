# set -x

function LOG_BASE() {
	local __what="$2"
	# Get time from date
    local __datestring=`date +'%Y-%m-%d %H:%M:%S'`
    # Expand escaped characters, wrap at 70 chars, indent wrapped lines
    echo -e "${__datestring} ${__what}" | fold -w70 -s | sed '2~1s/^/  /'
}

function LOGD() {
	local __what="$1"
	echo ${DEBUG}
	if [[ ${DEBUG} == "on" ]]
	then
		LOG_BASE ${__what}
	fi
}
