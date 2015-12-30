#!/bin/bash

# to maintain cask .... 
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup` 


# Install native apps

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Browsers
brew cask install firefox
brew cask install google-chrome
brew cask install google-chrome-canary

# Development
brew cask install iterm2
brew cask install android-studio
brew cask install atom
brew cask install dash
brew cask install github-desktop
brew cask install iterm2
brew cask install kaleidoscope
brew cask install sketch

# Other
brew cask install miro-video-converter
brew cask install google-drive
brew cask install music-manager
brew cask install gopro-studio
