#!/usr/bin/env bash

# One liner from https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "Script located in $SCRIPT_DIR"

# See update_files.sh for more info. Param order was changed here during copy
# param1 = Local computer location of the config file
# param2 = Config filename
# param3 = Git repo directory target
copy_file () {
    if [ -f "$1" ]; then
        cp -v $SCRIPT_DIR/$3/$2 $1/$2
    else
        echo "Target directory $1 does not exist. Skipping"
    fi
}

# Neovim files
copy_file /home/$USER/config/nvim init.vim nvim

# .gitconfig
copy_file /home/$USER .gitconfig git

# .bashrc
copy_file /home/$USER .bashrc bash

# Handy variable to hold target directory for nvim plugins and themes
LOCAL_DIR=/home/$USER/.local/share/nvim/site/pack

# Update variable for plugins
TARGET_DIR=$LOCAL_DIR/plugins/start
if ! [ -d "$TARGET_DIR" ]; then
    mkdir -p $TARGET_DIR
fi

git clone -C $TARGET_DIR https://github.com/python-mode/python-mode.git
git clone -C $TARGET_DIR https://github.com/hugolgst/vimsence.git
git clone -C $TARGET_DIR https://github.com/vim-airline/vim-airline
git clone -C $TARGET_DIR https://github.com/preservim/nerdtree.git
git clone -C $TARGET_DIR https://github.com/airblade/vim-gitgutter.git
git clone -C $TARGET_DIR https://github.com/rhysd/vim-grammarous.git
git clone -C $TARGET_DIR https://github.com/neomake/neomake.git
git clone -C $TARGET_DIR https://github.com/Xuyuanp/nerdtree-git-plugin.git

# Update variable for themes
TARGET_DIR=$LOCAL_DIR/colors/start
if ! [ -d "$TARGET_DIR" ]; then
    mkdir -p $TARGET_DIR
fi

# Dracula Theme
git clone -C $TARGET_DIR https://github.com/dracula/vim.git
