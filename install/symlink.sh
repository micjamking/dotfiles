#!/bin/bash

# ------------------------------------------------------- #
# Symlink all the things!
# ------------------------------------------------------- #

DIRECTORIES=(
    "bash"
    "scripts"
    "vim"
)

FILES=(
    ".bash_profile"
    ".bashrc"
    ".editorconfig"
    ".gitconfig"
    ".gitignore"
    ".inputrc"
    ".vimrc"
)

function symlink() {
  
    # Variables
    local TARGETPATH="${2:-$HOME/}"
    local ISSINGLEFILE="$3"
    local i=""
    local sourceFile=""
    local targetFile=""
    
    # If passing a single file in, 
    # make an array for convenience
    if [ "$ISSINGLEFILE" == "true" ] ; then
    
      local THINGS=( "$1" );

    else  
      
      local NAME=$1[@];
      local THINGS=("${!NAME}");

    fi
    
    # Loop to symlink things!
    for i in ${THINGS[@]}; do

        sourceFile="$HOME/.dotfiles/$i";
        targetFile="$TARGETPATH$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")";
        
        # If $targetFile does not exist
        if [ ! -e "$targetFile" ]; then
        
            sudo ln -fs "$sourceFile" "$targetFile" && echo "$targetFile → $sourceFile successfully!";
        
        # Else if $targetFile does exist and is a symlink to $sourceFile
        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
        
            echo "$targetFile → $sourceFile successfully!";
        
        else
            
            # Confirm user would like to delete existing file to create new symlink
            echo "'$targetFile' already exists, do you want to overwrite it? (y/n)";

            read -n 1

            echo "";
            
            # If yes, remove file and create symlink
            if [[ "$REPLY" =~ ^[Yy]$ ]]; then
                
                sudo rm -rf "$targetFile"
            
                sudo ln -fs "$sourceFile" "$targetFile" && echo "$targetFile → $sourceFile successfully!";
            
            # Otherwise output error
            else
            
                echo "Cannot create symlink for $targetFile → $sourceFile."
            
            fi
        fi

    done

}

echo "$(tput setaf 209)Linking up all the directories...$(tput sgr0)\n";
symlink DIRECTORIES "$HOME/."

echo "\n$(tput setaf 209)Linking up all the individual dotfiles...$(tput sgr0)\n";
symlink FILES "$HOME/"

 echo "\n$(tput setaf 209)Linking iTerm2 preferences...$(tput sgr0)\n";
 symlink "iterm/com.googlecode.iterm2.plist" "$HOME/Library/Preferences/" "true"

echo "\n$(tput setaf 209)Linking Apache configuration...$(tput sgr0)\n";
symlink "apache/httpd.conf" "/etc/apache2/extra/" "true"

echo "\n$(tput setaf 209)Linking PHP configuration...$(tput sgr0)\n";
symlink "php/php.ini" "/etc/" "true"
