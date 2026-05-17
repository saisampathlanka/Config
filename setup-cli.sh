#!/usr/bin/env bash

# =========================================================
# Modern Linux CLI Setup Script
#
# Installs & configures:
# - bat
# - eza
# - fd
# - ripgrep
# - fzf
#
# Supports:
# - Ubuntu
# - Debian
#
# Usage:
#   chmod +x setup-modern-cli.sh
#   ./setup-modern-cli.sh
# =========================================================

set -e

echo "========================================="
echo " Updating system"
echo "========================================="

sudo apt update
sudo apt upgrade -y

echo "========================================="
echo " Installing dependencies"
echo "========================================="

sudo apt install -y \
    curl \
    wget \
    git \
    unzip \
    gpg \
    software-properties-common

echo "========================================="
echo " Installing CLI tools"
echo "========================================="

sudo apt install -y \
    bat \
    fd-find \
    ripgrep \
    fzf

echo "========================================="
echo " Installing eza"
echo "========================================="

sudo mkdir -p /etc/apt/keyrings

wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
    | sudo gpg --dearmor -o /etc/apt/keyrings/eza.gpg

echo "deb [signed-by=/etc/apt/keyrings/eza.gpg] \
http://deb.gierens.de stable main" \
| sudo tee /etc/apt/sources.list.d/eza.list > /dev/null

sudo apt update
sudo apt install -y eza

echo "========================================="
echo " Creating local bin symlinks"
echo "========================================="

mkdir -p "$HOME/.local/bin"

# Ubuntu/Debian naming fixes
if command -v batcat >/dev/null 2>&1; then
    ln -sf "$(which batcat)" "$HOME/.local/bin/bat"
fi

if command -v fdfind >/dev/null 2>&1; then
    ln -sf "$(which fdfind)" "$HOME/.local/bin/fd"
fi

echo "========================================="
echo " Detecting shell"
echo "========================================="

if [[ "$SHELL" == *"zsh"* ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
else
    SHELL_CONFIG="$HOME/.bashrc"
fi

echo "Using shell config: $SHELL_CONFIG"

echo "========================================="
echo " Configuring PATH"
echo "========================================="

grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_CONFIG" || \
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_CONFIG"

echo "========================================="
echo " Adding aliases"
echo "========================================="

cat << 'EOF' >> "$SHELL_CONFIG"

# =========================================
# Modern CLI aliases
# =========================================

# bat
alias cat='bat --paging=never'

# eza
alias ls='eza --icons'
alias ll='eza -lh --icons --git'
alias la='eza -lah --icons --git'
alias tree='eza --tree --icons'

# fd
alias find='fd'

# ripgrep
alias grep='rg'

EOF

echo "========================================="
echo " Configuring BAT"
echo "========================================="

mkdir -p "$HOME/.config/bat"

cat << 'EOF' > "$HOME/.config/bat/config"
--theme="Dracula"
--style="numbers,changes,header"
EOF

if command -v bat >/dev/null 2>&1; then
    bat cache --build || true
fi

echo "========================================="
echo " Configuring FZF"
echo "========================================="

if [[ "$SHELL" == *"zsh"* ]]; then

    if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
        grep -qxF 'source /usr/share/doc/fzf/examples/key-bindings.zsh' "$SHELL_CONFIG" || \
        echo 'source /usr/share/doc/fzf/examples/key-bindings.zsh' >> "$SHELL_CONFIG"
    fi

    if [ -f /usr/share/doc/fzf/examples/completion.zsh ]; then
        grep -qxF 'source /usr/share/doc/fzf/examples/completion.zsh' "$SHELL_CONFIG" || \
        echo 'source /usr/share/doc/fzf/examples/completion.zsh' >> "$SHELL_CONFIG"
    fi

else

    if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
        grep -qxF 'source /usr/share/doc/fzf/examples/key-bindings.bash' "$SHELL_CONFIG" || \
        echo 'source /usr/share/doc/fzf/examples/key-bindings.bash' >> "$SHELL_CONFIG"
    fi

    if [ -f /usr/share/doc/fzf/examples/completion.bash ]; then
        grep -qxF 'source /usr/share/doc/fzf/examples/completion.bash' "$SHELL_CONFIG" || \
        echo 'source /usr/share/doc/fzf/examples/completion.bash' >> "$SHELL_CONFIG"
    fi

fi

echo "========================================="
echo " Reloading shell"
echo "========================================="

# shellcheck disable=SC1090
source "$SHELL_CONFIG" || true

echo ""
echo "========================================="
echo " Setup Complete!"
echo "========================================="
echo ""

echo "Try these commands:"
echo ""
echo "  ll"
echo "  la"
echo "  tree"
echo "  bat ~/.bashrc"
echo "  fd config"
echo "  rg TODO"
echo "  history | fzf"
echo ""

echo "Restart terminal if aliases don't work immediately."
