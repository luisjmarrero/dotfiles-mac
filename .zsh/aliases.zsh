alias sync-vault="git pull && git add . && git commit -m "sync vault" && git push origin main"


if [ -x "$(command -v exa)" ]; then
    alias ls="exa --icons"
    alias la="exa --long --all --group --icons"
fi


# usage: gacpm "commit message"
gacpm() {
  git add . && git commit -m $1 && git push origin master
}

# usage: gacp "commit message"
gacp() {
  git add . && git commit -m $1 && git push
}

# docker-compose stop build and up
docker-csbu() {
  docker-compose stop $1 && docker-compose build --no-cache $1 && docker-compose up -d --force-recreate $1
}

# Shortcut to running shell inside a docker container searching $1
# usage: $shbacano magento
function shbacano() {
  #do things with parameters like $1 such as
  echo "running sh into $(docker ps | grep "$1" | awk '{print $1 " " $2}')"
  docker exec -it $(docker ps | grep "$1" | awk '{print $1}') sh
}

# Shortcut to running shell inside a docker container searching $1
# usage: $bashbacano magento
function bashbacano() {
  #do things with parameters like $1 such as
  echo "running sh into $(docker ps | grep "$1" | awk '{print $1 " " $2}')"
  docker exec -it $(docker ps | grep "$1" | awk '{print $1}') bash
}