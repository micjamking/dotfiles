# ------------------------------------------- #
# Load our dotfiles like ~/.aliases, etc…
# ~/.env can be used to configure your PATH, 
# thus it being first in line.
# ------------------------------------------- #

for file in ~/.{env,exports,aliases,projects,functions}; do
      [ -r "$file" ] && source "$file"
done
unset file
