#!/bin/bash

echo "Reload nvm into current environment...\n";
source $(brew --prefix nvm)/nvm.sh

echo "Install latest version of node.js...\n";
nvm install stable
nvm alias default stable
nvm use default

echo "Install npm packages...\n";
npm install -g doctoc
npm install -g gulp
npm install -g http-server
npm install -g jsdoc
npm install -g markdown-preview
npm install -g node-sass
npm install -g npm-check-updates
npm install -g postcss
npm install -g yo

echo "NPM package installation complete. Exiting the Node...\n";
