if [[ $1 ]]; then
  if [ -f "$PWD/$1.sh" ]; then
    sudo bash "$PWD/$1.sh"
  else
    echo "Command does not exist"
    echo "Run 'server help'"
  fi
else
  echo "Invalid command run 'server help'"
fi
