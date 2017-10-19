#! /bin/bash

_RELATIVE_PATH=`dirname $BASH_SOURCE`
SCRIPTPATH=$( cd $_RELATIVE_PATH && pwd -P )

. $SCRIPTPATH/colors.sh
. $SCRIPTPATH/helpers.sh

if [ "$(whoami)" != "root" ]
then
    sudo echo 
fi

printf "${PADDING}\n"
printf "${ORANGE}Enabling access to Docker for ${USER} ${NC}\n"
printf "${BORDER}\n"


run_command "Adding ${USER} to the docker group" "sudo usermod -aG docker ${USER}"
printf "${YELLOW}\nYou need to logout and then login for the changes to be applied${NC}\n"

printf "${PADDING}\n"


