# setup.sh - bootstrap a new Mac from this .dotfiles repo

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---------------------------------------------------------------------------
# Check Homebrew is installed
# ---------------------------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  echo "Fant ingen gylding versjon av brew"
  echo "Last ned brew fra https://brew.sh/"
  exit 1
fi

# ---------------------------------------------------------------------------
# Install packages from Brewfile
# ---------------------------------------------------------------------------
if [[ -f "$DOTFILES_DIR/Brewfile" ]]; then
  echo "Laster ned pakker fra Brewfile..."
  brew bundle --file="$DOTFILES_DIR/Brewfile"
  echo ""
else
  echo "Fant ingen Brewfile her: $DOTFILES_DIR/Brewfile, skipping."
  echo ""
fi

# ---------------------------------------------------------------------------
# Symlinks
# ---------------------------------------------------------------------------
# Format: "label|source (relative to repo)|destination (absolute, ~ allowed)"
LINKS=(
  ".zshrc|.zshrc|$HOME/.zshrc"
  ".alias|.alias|$HOME/.alias"
  "git config|git/.gitconfig|$HOME/.gitconfig"
  "git ignore|git/.gitignore|$HOME/.gitignore"
)

confirm() {
  local prompt="$1"
  local response=""
  while [[ "$response" != "y" && "$response" != "n" ]]; do
    read -r -p "$prompt [y/N] " response
    response=$(echo "$response" | tr '[:upper:]' '[:lower:]')
    [[ -z "$response" ]] && response="n"
  done
  [[ "$response" == "y" ]]
}

create_symlink() {
  local label="$1"
  local src="$DOTFILES_DIR/$2"
  local dest="$3"

  echo "Setter opp symlink for $label"

  if [[ ! -e "$src" ]]; then
    echo "  Fant ikke fil på $src, skipping."
    echo ""
    return
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    echo "  Fil finnes allerede på $dest"
    if confirm "  Vil du overskrive den?"; then
      rm -f "$dest"
    else
      echo "  Skipping $label"
      echo ""
      return
    fi
  fi

  ln -s "$src" "$dest"
  echo "  Linka $dest -> $src"
  echo ""
}

for entry in "${LINKS[@]}"; do
  IFS="|" read -r label src dest <<< "$entry"
  create_symlink "$label" "$src" "$dest"
done

echo "setup av dotfiles er fullført:)"