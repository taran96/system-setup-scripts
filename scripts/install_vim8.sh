#! /bin/bash

_RELATIVE_PATH=`dirname $BASH_SOURCE`
SCRIPTPATH=$( cd $_RELATIVE_PATH && pwd -P )

. $SCRIPTPATH/colors.sh
. $SCRIPTPATH/helpers.sh

if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

VIM_SRC_DIR="/tmp/vim"
CONFIGURE_CMD=""

read -r -d '' CONFIGURE_CMD << EOM
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-cscope \
            --prefix=/usr/local
EOM


printf "${PADDING}\n"
printf "${ORANGE}Installing Vim 8${NC}\n"
printf "${BORDER}\n"



run_command "Updating sources" "sudo apt update"
run_command "Installing dependencies" "sudo apt install --yes python-dev python3-dev ruby-dev lua5.2 lua5.2-dev libperl-dev git"
run_command "Removing previous installations" "sudo apt remove --yes vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox"
run_command "Removing '/tmp/vim' if it exists" "sudo rm -rf $VIM_SRC_DIR"
run_command "Cloning vim source" "git clone https://github.com/vim/vim.git $VIM_SRC_DIR"
run_command "Changing directory to $VIM_SRC_DIR" "cd $VIM_SRC_DIR"
cd $VIM_SRC_DIR
run_command "Configuring vim build" "${CONFIGURE_CMD}"
run_command "Compiling vim" "make"
run_command "Installing vim" "sudo make install"
printf "${PADDING}\n"
