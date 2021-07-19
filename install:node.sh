#!/bin/bash
echo "Welcome to node installer"
echo "Installing Nodejs LTS"
cd ~
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
echo "Would you like to install build essentials?
Y|n
"
read r
if [[ "$r" == "y" || "$r" == "yes"  || "$r" == "Y" ]]; then
 sudo apt-get install -y build-essential
fi
echo "Installation Completed";
