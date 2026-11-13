#!/bin/bash

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Install oh-my-zsh at $HOME/.oh-my-zsh"
  exit 1
fi

mkdir -p "$HOME/.zsh"
if [[ ! -d "$HOME/.zsh/pure" ]]; then
  echo "Install pure theme at $HOME/.zsh/pure"
  exit 1
fi

if ! command -v stow >/dev/null 2>&1; then
  echo "Install stow"
  exit 1
fi

mkdir -p "$HOME/.config"
curr_dir=$(cd "$(dirname "${0}")" && pwd)

# Back up existing real files/folders ONLY if they are not already symlinks
[[ -e "$HOME/.config/nvim" && ! -L "$HOME/.config/nvim" ]] && mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
[[ -e "$HOME/.zsh_aliases" && ! -L "$HOME/.zsh_aliases" ]] && mv "$HOME/.zsh_aliases" "$HOME/.zsh_aliases.bak"

# Restow safely refreshes symlinks without deleting source files
stow -R -d "$curr_dir" -t "$HOME" nvim
stow -R -d "$curr_dir" -t "$HOME" zsh
