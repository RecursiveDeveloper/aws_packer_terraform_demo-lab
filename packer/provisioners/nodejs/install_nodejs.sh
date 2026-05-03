#!/bin/bash

cd ~
sudo curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
node -v
npm -v
