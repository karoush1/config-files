#!/usr/bin/env bash

# One liner from https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "Script located in $SCRIPT_DIR"

CURR_DATE_TIME_FMT="$(date +%Y%m%d%H%M%S)"
# echo "$CURR_TIME_FMT"

# See update_files.sh for more info. Param order was changed here during copy
# param1 = Local computer location of the config file
# param2 = Config filename
# param3 = Git repo directory target
copy_file () {
    if ! [ -d "$1" ]; then
        echo "Target directory $1 does not exist. Creating..."
        mkdir -p $1
    elif [ -f "$1/$2" ]; then
        echo "Target file $1/$2 exists. Creating backup as $1/$2-$CURR_DATE_TIME_FMT.backup"
        mv $1/$2 $1/$2-$CURR_DATE_TIME_FMT.backup
    fi
    cp -v $SCRIPT_DIR/$3/$2 $1/$2
}

# Neovim files
copy_file /home/$USER/.config/nvim init.vim nvim

# .gitconfig
copy_file /home/$USER .gitconfig git

# .bashrc
copy_file /home/$USER .bashrc bash

# Handy variable to hold target directory for nvim plugins and themes
LOCAL_DIR=/home/$USER/.local/share/nvim/site/pack

# Update variable for plugins
TARGET_DIR=$LOCAL_DIR/plugins/start
if ! [ -d "$TARGET_DIR" ]; then
    echo "Target directory $TARGET_DIR does not exist. Creating..."
    mkdir -p $TARGET_DIR
fi

cd $TARGET_DIR
git clone https://github.com/python-mode/python-mode.git
git clone https://github.com/hugolgst/vimsence.git
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/rhysd/vim-grammarous.git
git clone https://github.com/neomake/neomake.git
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git

# Update variable for themes
TARGET_DIR=$LOCAL_DIR/colors/start
if ! [ -d "$TARGET_DIR" ]; then
    echo "Target directory $TARGET_DIR does not exist. Creating..."
    mkdir -p $TARGET_DIR
fi

cd $TARGET_DIR
# Dracula Theme
git clone -C $TARGET_DIR https://github.com/dracula/vim.git

cd $SCRIPT_DIR
