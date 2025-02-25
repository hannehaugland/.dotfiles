echo "\n 🌊 🫐 🌿 Velkommen, Hanne! 🌿 🫐 🌊 \n"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Set starship config variable
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$DOTFILES/starship.toml

# Path to your oh-my-zsh installation.
export DOTFILES="$HOME/.dotfiles"

# Load path settings
source $DOTFILES/.path
# Load aliases
source $DOTFILES/.alias

# Docker 
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

############### P L U G I N S ################

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Syntax highlight 
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# python 3.12
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"

# yarn
export PATH="$PATH:`yarn global bin`"

# nvm 
export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
