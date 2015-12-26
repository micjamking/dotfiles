# Catalog of current .dotfiles

## Things I need to clean-up
```
├── .vim
├── .bash_profile
├── .bashrc
├── .editorconfig
├── .gitconfig
├── .profile
├── .vimrc
```
- Consolidate `.bash_profile` in to `.profile`
- Break apart `.profile` in to smaller components
  - `.aliases`
  - `.exports`
  - `.functions`

## Things I need to add

### Configuration
```
├── bin           # Folder for local bash/node scripts
├── .bash_prompt  # Shell prompt settings - https://github.com/mathiasbynens/dotfiles/blob/master/.bash_prompt
├── .inputrc      # Keyboard input settings - https://github.com/mathiasbynens/dotfiles/blob/master/.inputrc
├── .osx          # OSX default settings - https://mths.be/osx
├── .screenrc     # Screen settings - https://github.com/mathiasbynens/dotfiles/blob/master/.screenrc
```

### Setup & Installation
```
├── brew.sh       # Install command-line tools using Homebrew
├── brew-cask.sh  # Install native apps
├── node.sh       # Install nvm, node, and npm packages
├── backup.sh     # Creates backups of settings outside of .dotfiles - https://github.com/paulirish/dotfiles/blob/master/setup-a-new-machine.sh#L7
├── install.sh    # Installs Xcode command line tools, brew/brew-cask, node, wp-cli, osx settings, and symlink everything up - https://github.com/paulirish/dotfiles/blob/master/setup-a-new-machine.sh#L70
```
