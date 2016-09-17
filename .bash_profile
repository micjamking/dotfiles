# ------------------------------------------- #
# Load our dotfiles like ~/.aliases, etc…
# ~/.env can be used to configure your PATH, 
# thus it being first in line.
# ------------------------------------------- #

for file in ~/.{env,bash/.[^.]*,projects}; do

  # filename=$(tput setaf 81)$(basename $file)$(tput sgr0)
      
  [ -r "$file" ] && source "$file"
  
  # echo -e "$filename loaded.";

done

# echo "$(tput setaf 148)Done!$(tput sgr0)"

unset file

# Added by Grow SDK Installer (2016-06-29 22:27:14.465292)
alias grow="/Users/Mike/bin/grow"