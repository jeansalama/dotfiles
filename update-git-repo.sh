#!/bin/bash

DOTFILES_DIR=$(pwd)


echo
echo  ------------------------------------
echo  --- Updating remote git dotfiles ---
echo  ------------------------------------
echo

echo -- Update Vim config
echo
cp ~/.vimrc ${DOTFILES_DIR}


echo -- Update Git config
echo
cp ~/.gitconfig ${DOTFILES_DIR}


echo -- Update NPM config
echo
cp ~/.npmrc ${DOTFILES_DIR}


echo -- Update Bash configs
echo
cp ~/.bash_aliases ${DOTFILES_DIR}
cp ~/.bashrc ${DOTFILES_DIR}


echo -- Update User bin
echo
cp -r ~/bin ${DOTFILES_DIR}


echo -- Commit and push
DATE=$(date -I)
git add . && git commit -m "Update dotfiles - ${DATE}"
git push origin master
