#!/usr/bin/env bash
#
# Simple drop-in alternative for `pbcopy` which wipes the clipboard contents
# after a set time (30 seconds by default).

set -o errexit -o pipefail -o noclobber -o nounset

trap 'e=$?; if [ "$e" -ne "0" ]; then printf "LINE $BASH_LINENO: exit %s <- ${BASH_COMMAND}%s\\n" "$e" "$(printf " <- %s" "${FUNCNAME[@]:-main}")" 1>&2; fi' EXIT

PROGNAME="${0##*/}"
VERSION="0.1"

usage() {
	cat <<EOF
NAME
	${PROGNAME} -- copy standard input to clipboard temporarily

SYNOPSIS
	${PROGNAME} [-h] [-t SECONDS]

DESCRIPTION
	${PROGNAME} is a simple drop-in alternative for pbcopy which wipes the
	clipboard contents after a set time (30 seconds by default).

	The options are as follows:

	-h	print this help and exit

	-t SECONDS
		set the time in seconds to wait before clearing the clipboard
EOF
}

pbcopyt() {
	local input
	local expire_time

	input="$(cat -)"
	expire_time="$1"

	printf '%s' "$input" | pbcopy
	(
		sleep "$expire_time"
		if [ "$(pbpaste)" == "$input" ]; then
			printf '' | pbcopy
		fi
	)&
}

EXPIRE_TIME="30"
while getopts 'ht' opt; do
	case ${opt} in
		h)
			usage
			exit 0
			;;
		t)
			EXPIRE_TIME="$2"
			shift 2
			;;
		*)
			usage
			exit 1
			;;
	esac
done
if [ "$#" -ne "0" ]; then
	printf 'ERROR: unexpected args: %s\n\n' "$@"
	usage
	exit 1
fi
pbcopyt "$EXPIRE_TIME"

