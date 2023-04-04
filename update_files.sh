#!/usr/bin/env bash

# One liner from https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "Script located in $SCRIPT_DIR"

# param1 = Local computer location of the config file
# param2 = Config filename
# param3 = Git repo directory target
copy_file () {
    if [ -f "$1/$2" ]; then
        cp -v $1/$2 $SCRIPT_DIR/$3/$2
    else
        echo "File $1/$2 does not exist. Skipping"
    fi
}

# Neovim files
copy_file /home/$USER/config/nvim init.vim nvim

# .gitconfig
copy_file /home/$USER .gitconfig git

# .bashrc
copy_file /home/$USER .bashrc bash
