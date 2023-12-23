#!/usr/bin/env zsh

zshrc_file="$HOME/.zshrc"
export fzf_config="source $PWD/fzf-tab.plugin.zsh"

if grep -q "$fzf_config" "$zshrc_file"; then
    sed -i "/$(echo "$fzf_config" | sed 's/\//\\\//g')/d"  "$zshrc_file"
    echo "Content removed from $zshrc_file"
    exec zsh -l
else
	echo "Content not exists in $zshrc_file. Skipping..."
fi
