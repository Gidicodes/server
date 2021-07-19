path="$PWD/index.sh"
sudo echo  "alias server=\"bash $path\"" >> "~/.bashrc"
source "~/.bashrc"
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
