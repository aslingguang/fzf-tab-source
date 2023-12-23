#!/usr/bin/env zsh

# Switch between Ripgrep-all launcher mode (CTRL-R) and fzf filtering mode (CTRL-F)
if ! command -v rga &>/dev/null; then
    echo "ripgrep-all not installed"
else
    rm -f /tmp/rga-fzf-{r,f}
    RGA_PREFIX="rga --column --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="${*:-}"
    : | fzf --ansi --disabled --query "$INITIAL_QUERY" \
        --bind "start:reload($RGA_PREFIX {q})+unbind(ctrl-r)" \
        --bind "change:reload:sleep 0.1; $RGA_PREFIX {q} || true" \
        --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/rga-fzf-r; cat /tmp/rga-fzf-f)" \
        --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep-all> )+disable-search+reload($RGA_PREFIX {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/rga-fzf-f; cat /tmp/rga-fzf-r)" \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --prompt '1. ripgrep-all> ' \
        --delimiter : \
        --header '╱ CTRL-R (ripgrep-all mode) ╱ CTRL-F (fzf mode) ╱' \
        --preview 'rga "" {1} | bat --color=always  --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --bind 'enter:become(nvim {1} +{2})'
fi