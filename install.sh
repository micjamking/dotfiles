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

	[ $result -eq 0 ] \
	
  && echo -e "$(tput setaf 148)$success$(tput sgr0)" \
	
  || echo -e "$(tput setaf 197)$failure$(tput sgr0)"
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

# Run setup

echo "   _____     __         ______     __  __     ______        ______     ______     ______ "
echo " /\  __ \   /\ \       /\  __ \   /\ \_\ \   /\  __ \      /\  == \   /\  == \   /\  __ \ "
echo " \ \  __ \  \ \ \____  \ \ \/\ \  \ \  __ \  \ \  __ \     \ \  __<   \ \  __<   \ \ \/\ \ "
echo "  \ \_\ \_\  \ \_____\  \ \_____\  \ \_\ \_\  \ \_\ \_\     \ \_____\  \ \_\ \_\  \ \_____\ "
echo "   \/_/\/_/   \/_____/   \/_____/   \/_/\/_/   \/_/\/_/      \/_____/   \/_/ /_/   \/_____/ "

echo -e "\n";

echo -e "Welcome to @micjamking's computer setup. Let's #GSD!\n";

echo -e "First things first, we need to install Xcode command line tools...\n"

install_xcode_cli_tools

echo -e "Brewing all the things...\n"

source install/brew.sh

echo -e "Installing the only real programming language (node)...\n"

source install/node.sh
