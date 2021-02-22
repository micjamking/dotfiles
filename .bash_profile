# ------------------------------------------- #
# Load our dotfiles like ~/.aliases, etc…
# ~/.env can be used to configure your PATH, 
# thus it being first in line.
# ------------------------------------------- #

for file in ~/.{env,bash/.[^.]*,projects}; do

  filename=$(tput setaf 81)$(basename $file)$(tput sgr0)
      
  [ -r "$file" ] && source "$file"
  
#  echo -e "$filename loaded.";

done

# echo "$(tput setaf 148)Done!$(tput sgr0)"

unset file

# Added by Grow SDK Installer (2017-05-27 10:29:42.338805)
alias grow="/Users/zion/bin/grow"
# Added by Grow SDK Installer (2017-09-11 18:00:30.613050)
alias grow="/Users/kingmi/bin/grow"
# Added manually (2020-08-18 11:38:00.000000)
# alias grow="pipenv run grow"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kingmi/google-cloud-sdk/path.bash.inc' ]; then . '/Users/kingmi/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kingmi/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/kingmi/google-cloud-sdk/completion.bash.inc'; fi
