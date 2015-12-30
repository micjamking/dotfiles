#!/bin/bash

# ------------------------------------------------------- #
# Setup Mac for web development
# ------------------------------------------------------- #


# ------------------------------------------------------- #
# Utility functions
# ------------------------------------------------------- #

# Print result from last commands exit code

function print_result(){

  local result="$1"

  local success="$2"

  local failure="$3"

  [ $result -eq 0 ] && echo -e "$(tput setaf 148)$success$(tput sgr0)" || echo -e "$(tput setaf 197)$failure$(tput sgr0)"
}

# ------------------------------------------------------- #
# Installation functions
# ------------------------------------------------------- #

# Install Xcode Command Line Tools
# https://github.com/paulirish/dotfiles/blob/master/setup-a-new-machine.sh

function install_xcode_cli_tools() {

	if ! xcode-select --print-path &> /dev/null; then

	    # Prompt user to install the Xcode Command Line Tools
	    xcode-select --install &> /dev/null

	    # Wait until the Xcode Command Line Tools are installed
	    until xcode-select --print-path &> /dev/null; do
	        sleep 5
	    done

      print_result "$?" "Installed Xcode Command Line Tools successfully." "There was an error. Xcode command line tools not installed"

	    # Point the `xcode-select` developer directory to
	    # the appropriate directory from within `Xcode.app`
	    # https://github.com/alrra/dotfiles/issues/13

	    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

      print_result "$?" "Made `xcode-select` developer directory point to Xcode." "Unable to point `xcode-select` developer directory to Xcode."

	    # Prompt user to agree to the terms of the Xcode license
	    # https://github.com/alrra/dotfiles/issues/10

	    sudo xcodebuild -license

      print_result "$?" "Agreed with the Xcode Command Line Tools license."

	fi

}

# Setup Bash 4.x
# https://github.com/paulirish/dotfiles/blob/master/setup-a-new-machine.sh#L167

function setup_bash() {
  
  # Update to Bash 4.x (installed by Homebrew)
  BASHPATH=$(brew --prefix)/bin/bash
  
  sudo echo $BASHPATH >> /etc/shells
  
  # Set for current user
  chsh -s $BASHPATH
  
  # Should display 4.x instead of 3.2.X
  echo $BASH_VERSION
  
  echo "Bash it up!\n";
}

# Run setup

echo "";

# Epic intro...
echo "$(tput setaf 79)   _____     __         ______     __  __     ______        ______     ______     ______ $(tput sgr0)"
echo "$(tput setaf 227) /\  __ \   /\ \       /\  __ \   /\ \_\ \   /\  __ \      /\  == \   /\  == \   /\  __ \ $(tput sgr0)"
echo "$(tput setaf 209) \ \  __ \  \ \ \____  \ \ \/\ \  \ \  __ \  \ \  __ \     \ \  __<   \ \  __<   \ \ \/\ \ $(tput sgr0)"
echo "$(tput setaf 204)  \ \_\ \_\  \ \_____\  \ \_____\  \ \_\ \_\  \ \_\ \_\     \ \_____\  \ \_\ \_\  \ \_____\ $(tput sgr0)"
echo "$(tput setaf 162)   \/_/\/_/   \/_____/   \/_____/   \/_/\/_/   \/_/\/_/      \/_____/   \/_/ /_/   \/_____/ $(tput sgr0)"

echo "\n";

echo "Welcome to $(tput setaf 79)@micjamking's$(tput sgr0) _EPIC_ computer setup. Let's $(tput setaf 204)#GSD!$(tput sgr0)\n";

# The "lord's work"...
echo "First things first, we need to install $(tput setaf 79)Xcode Command Line Tools$(tput sgr0)...\n";

install_xcode_cli_tools;

echo "Easy breasy! Next up...\n";

echo "$(tput setaf 227)Brewing$(tput sgr0) all the things...\n";

source install/brew.sh;
source install/brew-cask.sh;

echo "Entering the $(tput setaf 148)Node$(tput sgr0)...\n";

source install/node.sh;

echo "'I found you, Miss New Booty', $(tput setaf 162)Bash 4$(tput sgr0)...\n";

setup_bash;

echo "...those $(tput setaf 79)OS X preferences$(tput sgr0) though? 'got you!\n";

source install/osx.sh;

echo "$(tput setaf 204)♫♫ sYmLiNk It AlL uP! ♫♫$(tput sgr0) *sing it like The Jeffersons: $(tput setaf 209)https://www.youtube.com/watch?v=FHDwRECFL8M$(tput sgr0)*\n";

source install/symlink.sh;

echo "...aaaaaaaaaaaaaaaaaaaaaaaaaaannnnnnnnnd were $(tput setaf 148)done!$(tput sgr0)\n";

echo "Now GO! On to more important things...\n";
