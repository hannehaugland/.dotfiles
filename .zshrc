# Welcome message
echo "\n 🌊 🌷 🫐 🌿 Velkommen, Hanne! 🌿 🫐 🌷 🌊 \n"

# Path to dotfiles
export DOTFILES=$HOME/.dotfiles

HOMEBREW_PREFIX=$(brew --prefix)

# Load custom path settings and aliases
source $DOTFILES/.path
source $DOTFILES/.alias

############### P L U G I N S ################

# autojump
[ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh

# Syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh