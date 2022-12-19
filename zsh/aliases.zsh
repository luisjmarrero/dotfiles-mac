# aliases.zsh

# sync obsidian vault to git
alias sync-vault="git pull && git add . && git commit -m "sync vault" && git push origin main"

# exa 
if [ -x "$(command -v exa)" ]; then
    alias ls="exa --icons"
    alias la="exa --long --all --group --icons"
    alias l='exa -lah --icons'
    alias tree 'exa --tree --icons --all'
fi


# git aliases
function gacpm() {
  git add . && git commit -m $1 && git push origin 
}

function gacp() {
  git add . && git commit -m $1 && git push
}

# docker aliases
docker-csbu() {
  docker-compose stop $1 && docker-compose build --no-cache $1 && docker-compose up -d --force-recreate $1
}

function shbacano() {
  #do things with parameters like $1 such as
  echo "running sh into $(docker ps | grep "$1" | awk '{print $1 " " $2}')"
  docker exec -it $(docker ps | grep "$1" | awk '{print $1}') sh
}

function bashbacano() {
  #do things with parameters like $1 such as
  echo "running sh into $(docker ps | grep "$1" | awk '{print $1 " " $2}')"
  docker exec -it $(docker ps | grep "$1" | awk '{print $1}') bash
}

# node aliases
function pnode() {
  find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
}

# jsons 

alias jj="pbpaste | jsonpp | pbcopy"

alias jj="pbpaste | jsonpp"

# directories

function take() {
  mkdir -p $1
  cd $1
}

alias rm=trash # brew install trash