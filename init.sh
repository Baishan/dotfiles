#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln ${SCRIPT_DIR}/.tmux.conf ~/.tmux.conf
