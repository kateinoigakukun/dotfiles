export TERM="xterm-256color"
export EDITOR=/usr/local/bin/nvim
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
export XDG_CONFIG_HOME=$HOME/.config
export PGDATA=/usr/local/var/postgres
export DOTFILE_PATH=$HOME/dotfiles

path=(
    /usr/local/opt/libiconv/bin(N-/)
    /usr/local/opt/llvm/bin(N-/)
    $HOME/.local/bin(N-/)
    $HOME/.cabal/bin(N-/)
    $path
)

