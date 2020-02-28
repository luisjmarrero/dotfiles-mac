# dotfiles
These are my dotfiles.

## Setup

I use zsh and oh-my-zsh, since I don't have my `.zshrc` in git yet I need to add this function to it

```shell
# import aliases
if [ -f ~/dotfiles/.aliases ]; then
    . ~/dotfiles/.aliases
else 
    echo "no aliases file found!!"
fi

```

> More files would be added in the future.
