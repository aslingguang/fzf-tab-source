0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
source "${0:A:h}/fzf-tab.zsh"
source "${0:A:h}/myfzf/fzf-config.zsh"
# source "${0:A:h}/myfzf/completion.zsh"
source "${0:A:h}/myfzf/key-bindings.zsh"
alias rf="${0:A:h}/myfzf/rg-fzf.zsh"
alias rfa="${0:A:h}/myfzf/rga-fzf.zsh" 
