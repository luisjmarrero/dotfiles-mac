# luisjmarrero's .zshrc

# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/luisjmarrero/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# import aliases
if [ -f ~/dotfiles/.aliases ]; then
    . ~/dotfiles/.aliases
else 
    echo "no aliases file found!!"
fi

# exports
if [ -f ~/dotfiles/.exports ]; then
    . ~/dotfiles/.exports
else 
    echo "no exports file found!!"
fi

# Context: user@hostname (who am I and where am I)
prompt_context() {
 if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment blue $CURRENT_FG '%c'
}
