#!/usr/bin/env zsh

zshrc_file="$HOME/.zshrc"
export fzf_config="source $PWD/fzf-tab.plugin.zsh"

if grep -q "$fzf_config" "$zshrc_file"; then
	echo "Content already exists in $zshrc_file. Skipping..."
else
	echo "$fzf_config" >>"$zshrc_file"
	echo "Content appended to $zshrc_file"
	exec zsh -l
fi


