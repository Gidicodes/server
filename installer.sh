path="$PWD/index.sh"
if [ -f "~/.bashrc" ]; then
  sudo echo  "alias server=\"bash $path\"" >> "~/.bashrc"
else
  sudo touch "~/.bashrc"
  sudo echo  "alias server=\"bash $path\"" >> "~/.bashrc"
fi
sudo source "~/.bashrc"
sudo echo "
#!/bin/bash
if [[ \$1 ]]; then
  if [ -f \"$PWD/\$1.sh\" ]; then
    sudo bash \"$PWD/\$1.sh\"
  else
    echo \"Command does not exist\"
    echo \"Run 'server help'\"
  fi
else
  echo \"Invalid command run 'server help'\"
fi
">"index.sh"

echo "Delete installer?
Y|n
"
read r
if [[ "$r" == "y" || "$r" == "yes"  || "$r" == "Y" ]]; then
 sudo rm "$PWD/installer.sh"
fi
echo "Installation done
Run 'server help'
"
