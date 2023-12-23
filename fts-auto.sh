#!/bin/bash

helpinfo="  fzf-tab-source用法:
    -a, --add           启用插件/Enable plugins
    -c, --content       添加到~/.zshrc的配置内容/Configuration content added to ~/.zshrc
    -d, --delete        禁用插件/Disable plugins
    -s, --status        插件状态(启用/禁用)/Plugin status (enabled/disabled)
    -u. --update        更新配置/Update Configuration
    -v, --version       版本信息/Print program version
    -h, --help          帮助信息/Display this help list"

script_path=$(dirname "$(readlink -f "$0")")
fzf_config="source $script_path/fzf-tab.plugin.zsh"
matched_line=$(grep -B1 -P "(?<!#)$fzf_config" "$HOME/.zshrc" | grep -v "#")

if [[ $1 == "-a" || $1 == "--add" ]]; then
    if [[ -n "$matched_line" ]]; then
        echo "Configuration already exists in $HOME/.zshrc. Skipping..."
    else
        echo "$fzf_config" >> "$HOME/.zshrc"
        echo "Configuration appended to $HOME/.zshrc"
        exec zsh -l

    fi
elif [[ $1 == "-c" || $1 == "--content" ]]; then
    echo "\"$fzf_config\""
elif [[ $1 == "-s" || $1 == "--status" ]]; then
    if [[ -n "$matched_line" ]]; then
        echo "enable"   
    else
        echo "disable"   
    fi
elif [[ $1 == "-d" || $1 == "--delete" ]]; then
    if [[ -n "$matched_line" ]]; then
        sed -i "/$(echo "$fzf_config" | sed 's/\//\\\//g')/d"  "$HOME/.zshrc"
        echo "Configuration removed from $HOME/.zshrc"
        exec zsh -l

    else
        echo "Content not exists in $HOME/.zshrc. Skipping..."
    fi
elif [[ $1 == "-u" || $1 == "--update" ]]; then
    exec zsh -l
elif [[ $1 == "-h" || $1 == "--help" ]]; then
    echo "$helpinfo"
elif [[ $1 == "-v" || $1 == "--version" ]]; then
    echo "v1.0.2"
else
    echo "Option error"
    echo "$helpinfo"
fi