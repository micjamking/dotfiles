#!/bin/bash

# to maintain cask .... 
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup` 


# Install native apps
brew install homebrew/cask
brew tap homebrew/cask

# Browsers
brew install --cask firefox
brew install --cask google-chrome
brew install --cask google-chrome-canary

# Development
brew install --cask android-studio
brew install --cask atom
brew install --cask iterm2
brew install --cask java
brew install --cask kaleidoscope

# Other
brew install --cask google-drive
brew install --cask miro-video-converter
