# luisjmarrero's .zshrc

# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/luisjmarrero/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# import aliases
if [ -f ~/dotfiles/.aliases ]; then
    . ~/dotfiles/.aliases
else 
    echo "no aliases file found!!"
fi

# exports
if [ -f ~/dotfile/.exports ]; then
    . ~/dotfile/.exports
fi