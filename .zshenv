export TERM="xterm-256color"
export EDITOR=/usr/local/bin/nvim
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
export XDG_CONFIG_HOME=$HOME/.config
export PGDATA=/usr/local/var/postgres


path=(
    /usr/local/opt/libiconv/bin
    $HOME/.pyenv
    $PYENV_ROOT/bin
    $path
)

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

alias rm=trash
alias vim=nvim
alias vi=nvim

