#!/bin/bash
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;36m"
NORMAL="\033[0m"

solarized_repo=https://github.com/altercation/vim-colors-solarized.git
tmp=$(mktemp -d)

if [ ! -d ~/.vim/colors ]; then
    printf "${GREEN}%s${NORMAL}\n" "Creating ~/.vim/colors folder"
    mkdir ~/.vim/colors
fi

git clone $solarized_repo $tmp || {
    printf "${RED}Could not clone solarized repo${NORMAL}\n"
    exit 1
}

mv $tmp/colors/solarized.vim ~/.vim/colors
