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
printf "${ORANGE}Installing Docker${NC}\n"
printf "${BORDER}\n"

run_command "Adding GPG" 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add '
run_command "Adding Docker repository to APT Sources (requires add-apt-repository)" '$(sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable")'
run_command "Updating sources" "sudo apt update"
run_command "Installing docker" "sudo apt install --yes docker-ce"

printf "${PADDING}\n"


