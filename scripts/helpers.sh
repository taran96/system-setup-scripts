#! /bin/bash

PADDING="${BLUE}###############################################################################${NC}"
BORDER="${LIGHT_BLUE}-------------------------------------------------------------------------------${NC}"
OK="${LIGHT_GREEN} OK ${NC}"
WAIT="${YELLOW}....${NC}"
FAIL="${LIGHT_RED}FAIL${NC}"
OUTPUT=""

getStatus() {
	if [ $? -eq 0 ]; then
		printf "\r\033[K[$OK] $1\n"
	else
		printf  "\r\033[K[$FAIL] $1"
		printf  "${OUTPUT}\n"
	fi
}


run_command() {
	printf "[${WAIT}] $1"
	OUTPUT=`$2 2>&1`
	getStatus "$1"
}


