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
printf "${ORANGE}Installing zsh with oh_my_zsh!${NC}\n"
printf "${BORDER}\n"

printf "\n${YELLOW}WARNING: oh_my_zsh's install script starts another zsh session within the current session so exit session when the prompt comes up while still installing${NC}\n"
run_command "Updating sources" "sudo apt update"
run_command "Installing zsh" "sudo apt install --yes zsh"
cd /tmp
run_command "Downloading oh_my_zsh" "curl -o install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
run_command "Make install script executable" "sudo chmod +x install.sh"
run_command "Installing oh_my_zsh for ${SUDO_USER}" './install.sh'

printf "${PADDING}\n"


