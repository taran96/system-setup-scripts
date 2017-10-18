#!/bin/bash

_RELATIVE_PATH=`dirname $BASH_SOURCE`
SCRIPTPATH=$( cd $_RELATIVE_PATH && pwd -P )

. $SCRIPTPATH/colors.sh
. $SCRIPTPATH/helpers.sh

printf "${PADDING}\n"
printf "${ORANGE}Installing Vim Plug${NC}\n"
printf "${BORDER}\n"

VIM_AUTOLOAD_DIR="${HOME}/.vim/autoload"

run_command "Creating autoload directory" "mkdir -p $VIM_AUTOLOAD_DIR"
run_command "Changing into $VIM_AUTOLOAD_DIR" ""
cd $VIM_AUTOLOAD_DIR
run_command "Downloading plug.vim" "curl -o plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

printf "${PADDING}\n"

