#!/bin/bash

# Install command-line tools using Homebrew.

echo "Install Homebrew\n";
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# If brew is installed, make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

echo "Install GNU core utilities (those that come with OS X are outdated).\n";
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
[ -e "/usr/local/bin/sha256sum" ] && rm -rf /usr/local/bin/sha256sum
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

echo "Install GNU sed, overwriting the built-in sed.\n";
brew install gnu-sed --with-default-names

echo "Install Bash 4.\n";
brew install bash

echo "Install Homebrew versions.\n";
brew tap homebrew/versions

echo "Install autocompletion.\n";
brew install bash-completion
brew tap homebrew/completions
brew install wpcli-completion

echo "Install more recent versions of some OS X tools.\n";
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

echo "Install other useful binaries.\n";
brew install git
brew install ffmpeg
brew install heroku-toolbelt
brew install imagemagick --with-webp
brew install mongodb
brew install postgresql
brew install mysql
brew install nvm
brew install tree
brew install homebrew/php/wp-cli

echo "Remove outdated versions from the cellar.\n";
brew cleanup

echo "Done brewing! On to the next one...\n";
