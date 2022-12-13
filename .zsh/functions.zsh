# delete all node_modules in current folder and sub folder
prune-node-modules() {
  find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
}

alias kraken="open -na 'GitKraken' --args -p $(pwd)"

# This is a general-purpose function to ask Yes/No questions in Bash, either
# with or without a default answer. It keeps repeating the question until it
# gets a valid answer.

ask() {
  local prompt default reply

  if [ "${2:-}" = "Y" ]; then
    prompt="Y/n"
    default=Y
  elif [ "${2:-}" = "N" ]; then
    prompt="y/N"
    default=N
  else
    prompt="y/n"
    default=
  fi

  while true; do

    # Ask the question (not using "read -p" as it uses stderr not stdout)
    echo -n "$1 [$prompt] "

    # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
    read reply </dev/tty

    # Default?
    if [ -z "$reply" ]; then
      reply=$default
    fi

    # Check if the reply is valid
    case "$reply" in
    Y* | y*) return 0 ;;
    N* | n*) return 1 ;;
    esac

  done
}

# Find and kill process
# usage: fkill python , fkill java
function fkill() {
  cnt=$(ps aux | grep -i $1 | grep -v grep | wc -l) # total count of processes found

  echo -e "\nSearching for '$1' -- Found" $cnt "Running Processes .. "
  ps aux | grep -i $1 | grep -v grep

  if [ "$cnt" -gt 0 ]; then
    # Default to Yes if the user presses enter without giving an answer:
    if ask "\nAre you really sure you want to kill everything found?" Y; then
      echo -e '\nTerminating' $cnt 'processes .. '

      ps aux | grep -i $1 | grep -v grep | awk '{print $2}' | xargs sudo kill -9
      echo -e "Done!\n"

      echo "Running search again:"
      ps aux | grep -i $1 | grep -v grep
      echo -e "\n"
    else
      echo "Nothing were killed..."
    fi
  else
    echo "Nothing to kill!"
  fi

}