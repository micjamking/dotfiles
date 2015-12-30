#!/bin/bash

# Install latest version of node.js via npm and npm packages

# Reload nvm into current environment
source $(brew --prefix nvm)/nvm.sh

# Install latest version of node.js
nvm install stable
nvm alias default stable

# Install npm packages
npm install -g bower
npm install -g doctoc
npm install -g grunt-cli
npm install -g grunt-init
npm install -g http-server
npm install -g jsdoc
npm install -g markdown-preview
npm install -g node-sass
npm install -g npm-check-updates
npm install -g postcss
npm install -g yo

echo -e "NPM package installation complete. Exiting the Node...\n";
