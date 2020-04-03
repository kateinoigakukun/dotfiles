zplug "plugins/git", from:oh-my-zsh
zplug "jhawthorn/fzy", \
    as:command, \
    hook-build:"make && sudo make install"
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure', use:pure.zsh
zplug "zsh-users/zsh-completions"
zplug "${HOME}/dotfiles/zsh/functions", from:local, use:"*.zsh"
