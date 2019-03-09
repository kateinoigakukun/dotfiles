zplug "plugins/git", from:oh-my-zsh
zplug "jhawthorn/fzy", \
    as:command, \
    hook-build:"make && sudo make install"
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure', use:pure.zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/zsh-history-enhanced", use:init.zsh
if zplug check "b4b4r07/zsh-history-enhanced"; then
    ZSH_HISTORY_FILTER="fzy"
    ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
    ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
fi
zplug "zsh-users/zsh-completions"
zplug "~/dotfiles/zsh/functions", from:local, use:"*.zsh"
