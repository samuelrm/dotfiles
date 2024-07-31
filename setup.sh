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

if [[ $(command -v stow > /dev/null) ]]; then
    echo "Install stow"
    exit 1
fi

mkdir -p "$HOME/.config"
curr_dir=$(cd "$(dirname "${0}")" && pwd)

rm -rf "$HOME/.config/nvim"
ln -sf "${curr_dir}/nvim" "$HOME/.config/nvim"

rm -rf "$HOME/.zshrc" "$HOME/.zsh_aliases"
stow zsh

# TODO: Differentiate between personal and work 
rm -rf "$HOME/.gitconfig"
stow git
