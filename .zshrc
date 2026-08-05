# Welcome message
echo "\n 🌊 🌷 🫐 🌿 Velkommen, Hanne! 🌿 🫐 🌷 🌊 \n"

# Path to dotfiles
export DOTFILES="$HOME/.dotfiles"
HOMEBREW_PREFIX=$(brew --prefix)

# Load custom aliases
source "$DOTFILES/.alias"

###### P L U G I N S   &   P R O M T ######

# autojump
[ -f "$HOMEBREW_PREFIX/etc/profile.d/autojump.sh" ] && \
  source "$HOMEBREW_PREFIX/etc/profile.d/autojump.sh"

# starship
command -v starship >/dev/null && \
  eval "$(starship init zsh)"

# syntax highlighting — must load after other plugins/keybindings
[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
