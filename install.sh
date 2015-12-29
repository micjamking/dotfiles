#!/bin/bash

# Setup Mac for web development

# ------------------------------------------------------- #
# Install Xcode Command Line Tools
# https://github.com/paulirish/dotfiles/blob/master/setup-a-new-machine.sh
# ------------------------------------------------------- #

function install_xcode_tools() {

	if ! xcode-select --print-path &> /dev/null; then

	    # Prompt user to install the Xcode Command Line Tools
	    xcode-select --install &> /dev/null

	    # Wait until the Xcode Command Line Tools are installed
	    until xcode-select --print-path &> /dev/null; do
	        sleep 5
	    done

		[ $1 -eq 0 ] \
		&& echo -e "$(tput setaf 148) Installed Xcode Command Line Tools successfully. $(tput sgr0)" \
		|| echo -e "$(tput setaf 197) There was an error. Xcode command line tools not installed $(tput sgr0)"

	    # Point the `xcode-select` developer directory to
	    # the appropriate directory from within `Xcode.app`
	    # https://github.com/alrra/dotfiles/issues/13

	    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

		[ $1 -eq 0 ] \
		&& echo -e "$(tput setaf 148) Made `xcode-select` developer directory point to Xcode. $(tput sgr0)" \
		|| echo -e "$(tput setaf 197) Unable to point `xcode-select` developer directory to Xcode. $(tput sgr0)"

	    # Prompt user to agree to the terms of the Xcode license
	    # https://github.com/alrra/dotfiles/issues/10

	    sudo xcodebuild -license

		[ $1 -eq 0 ] && echo -e "$(tput setaf 148) Agreed with the Xcode Command Line Tools license. $(tput sgr0)"

	fi

}

# Run setup
echo "   _____     __         ______     __  __     ______        ______     ______     ______ "
echo " /\  __ \   /\ \       /\  __ \   /\ \_\ \   /\  __ \      /\  == \   /\  == \   /\  __ \ "
echo " \ \  __ \  \ \ \____  \ \ \/\ \  \ \  __ \  \ \  __ \     \ \  __<   \ \  __<   \ \ \/\ \ "
echo "  \ \_\ \_\  \ \_____\  \ \_____\  \ \_\ \_\  \ \_\ \_\     \ \_____\  \ \_\ \_\  \ \_____\ "
echo "   \/_/\/_/   \/_____/   \/_____/   \/_/\/_/   \/_/\/_/      \/_____/   \/_/ /_/   \/_____/ "

echo -e "\n";

echo -e "Let's get your machine setup!\n";

echo -e "First things first, we need to install Xcode command line tools...\n" && install_xcode_tools;
echo -e "Brewing all the things...\n" && source install/brew.sh;
echo -e "Installing the only real programming language (node)...\n" && source install/node.sh;
