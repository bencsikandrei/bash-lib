#!/bin/bash

FILE_NOT_FOUND=1
BAD_ARGUMENT=2

# Script variables
LICENSE="AwesomeLicense"
MAIL="andrei.bencsik@gmail.com"
SITE="https://www.awesome.nonexisting.com"
COMPANY="Awesomeness Factory"

COPYRIGHT="/* Copyright (C) 2018 ${COMPANY} - All Rights Reserved
* You may use, distribute and modify this code under the
* terms of the ${LICENSE} license.
*
* You should have received a copy of the ${LICENSE} license with
* this file. If not, please write to: ${MAIL}, or visit : ${SITE}
*/
"

file_has_copyright() {
	local __file="$1"
	local __firstLine=$(head -1 ${__file})

	case "${__firstLine}" in
		*'Copyright (C)'*)
			# "Already has copyright notice.  Do nothing."
			echo 1
			;;
		*)
			# echo "Adding copyright notice to ${__file}."
			echo 0
			;;
	esac
}

file_exists() {
	local __file="$1"

	if [ ! -f ${__file} ]; then
		echo "-- File not found.  Aborting."
		exit ${FILE_NOT_FOUND}
	fi
}

file_add_copyright() {
	local __file="$1"
	local __crNotice="$2"
	local __tmp=$(mktemp /tmp/${__file}.XXXXXX)

	file_exists "${__file}"

	local __hasCr=$(file_has_copyright ${__file})
	if [ ${__hasCr} -eq 0 ]; then
		echo "-- Adding Copyright notice to ${__file}."
		echo "${__crNotice}" > "${__tmp}"
		cat "${__file}" >> "${__tmp}"
		mv "${__tmp}" "${__file}"
	else
		echo "-- ${__file} already contains a copyright notice.  Nothing to do."
	fi
}


## Main
if [ -z "$1" ]; then
	echo "-- Please provide a file name for this script. Aborting."
	exit ${BAD_ARGUMENT}
fi

file_add_copyright "$1" "${COPYRIGHT}"
