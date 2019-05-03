export TERM="xterm-256color"
export EDITOR=/usr/local/bin/nvim
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
export XDG_CONFIG_HOME=$HOME/.config
export PGDATA=/usr/local/var/postgres
export PYENV_ROOT=$HOME/.pyenv
export GOPATH=$HOME/.go
export DOTFILE_PATH=$HOME/dotfiles
export ZPLUG_HOME=$HOME/.zplug

RUBY_VERSION=$(cat $HOME/.rbenv/version)
RUBY_MINOR=${RUBY_VERSION%.*}.0
BUNDLE_PATH=$DOTFILE_PATH/vendor/bundle/ruby/$RUBY_MINOR

path=(
    /usr/local/opt/libiconv/bin(N-/)
    $HOME/.local/bin(N-/)
    $HOME/.cabal/bin(N-/)
    $PYENV_ROOT/bin(N-/)
    $BUNDLE_PATH/bin(N-/)
    $path
)

alias rm=trash
