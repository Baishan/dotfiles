#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln -s ${SCRIPT_DIR}/.tmux.conf ~/.tmux.conf
ln -s ${SCRIPT_DIR}/.zshrc ~/.zshrc
ln -s ${SCRIPT_DIR}/powerlevel10k ~/.powerlevel10k
ln -s ${SCRIPT_DIR}/.p10k.zsh ~/.p10k.zsh
ln -s ${SCRIPT_DIR}/fzf ~/.fzf

~/.fzf/install

