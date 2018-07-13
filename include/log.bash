## Colors

source "${BASH_SOURCE%/*}/colors.bash"

function LOG_BASE() {
	local __level="$1"
	local __color="$2"
	local __what="$3"
	# Get time from date
    local __datestring=`date +'%Y-%m-%d %H:%M:%S'`
    # Expand escaped characters, wrap at 70 chars, indent wrapped lines
    echo -e "${__datestring} [${__color}${__level}${COLOR_NORMAL}] ${__what}" | fold -w70 -s | sed '2~1s/^/  /'
}

## Log errors with DBG and green as a color
function LOGD() {
	local __what="$1"
	if [[ ${DEBUG} == "on" ]]
	then
		LOG_BASE "DBG" ${COLOR_GREEN} "${__what}"
	fi
}

## Log errors with ERR and red as a color
function LOGE() {
	local __what="$1"
	LOG_BASE "ERR" ${COLOR_RED} "${__what}"
}

## Log errors with INF and none as a color
function LOGI() {
	local __what="$1"
	LOG_BASE "INF" ${COLOR_NORMAL} "${__what}"
}

## Log errors with WRN and none as a color
function LOGW() {
	local __what="$1"
	LOG_BASE "WRN" ${COLOR_YELLOW} "${__what}"
}
