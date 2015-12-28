# ---------------------------------------------------- #
# Backup / annual refresh prep
# ---------------------------------------------------- #

# What is worth reinstalling?
brew leaves           > brew-list.txt
brew cask list        > cask-list.txt
npm list -g --depth=0 > npm-g-list.txt

# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)
