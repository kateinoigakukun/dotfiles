zplug "plugins/git", from:oh-my-zsh
zplug "jhawthorn/fzy", \
    as:command, \
    hook-build:"make && sudo make install"
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure', use:pure.zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/zsh-history-ltsv", use:init.zsh, defer:2
if zplug check "b4b4r07/zsh-history-ltsv"; then
    ZSH_HISTORY_FILTER="fzy:fzf:peco:percol"
    ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
    ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
fi
zplug "zsh-users/zsh-completions"
zplug "${HOME}/dotfiles/zsh/functions", from:local, use:"*.zsh"
