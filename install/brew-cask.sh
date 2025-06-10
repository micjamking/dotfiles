#!/bin/bash

# to maintain cask .... 
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup` 


# Install native apps

brew tap homebrew/cask
brew tap homebrew/cask-versions

# Browsers
brew install firefox --cask
brew install google-chrome --cask
brew install google-chrome@canary --cask

# Development
brew install android-studio --cask
brew install visual-studio-code --cask
brew install iterm2 --cask
brew install java
brew install kaleidoscope --cask
brew install figma --cask
