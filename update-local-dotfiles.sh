#!/bin/bash

DOTFILES_DIR=$(pwd)


echo
echo  -------------------------------
echo  --- Updating local dotfiles ---
echo  -------------------------------
echo

echo -- Update Vim config
echo
cp ${DOTFILES_DIR}/.vimrc ~/.vimrc


echo -- Update Git config
echo
cp ${DOTFILES_DIR}/.gitconfig ~/.gitconfig


echo -- Update NPM config
echo
cp ${DOTFILES_DIR}/.npmrc ~/.npmrc


echo -- Update Bash configs
echo
cp ${DOTFILES_DIR}/.bash_aliases ~/.bash_aliases
cp ${DOTFILES_DIR}/.bashrc ~/.bashrc


echo -- Update User bin
echo
cp -r ${DOTFILES_DIR}/bin ~/bin

