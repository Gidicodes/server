
if [[ $1 ]]; then
  if [ -f "/Users/mac1/IdeaProjects/ubuntu/$1.sh" ]; then
    sudo bash "/Users/mac1/IdeaProjects/ubuntu/$1.sh"
  else
    echo "Command does not exist"
    echo "Run 'server help'"
  fi
else
  echo "Invalid command run 'server help'"
fi

