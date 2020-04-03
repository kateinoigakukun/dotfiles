zsh_dir=$DOTFILE_PATH/zsh

function plug() {
    source $zsh_dir/$1/*.zsh
}

function add_fpath() {
    fpath+=$zsh_dir/$1
}

plug 'third_party/zsh-syntax-highlighting'
plug 'third_party/zsh-async'
plug 'third_party/pure'
plug 'third_party/zsh-completions'
plug 'functions'

add_fpath 'third_party/pure'

autoload -U promptinit; promptinit
prompt pure
