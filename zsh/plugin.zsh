zsh_dir=$DOTFILE_PATH/zsh

function plugin() {
    source $zsh_dir/$1
}

function add_fpath() {
    fpath+=$zsh_dir/$1
}

plugin 'third_party/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
plugin 'third_party/zsh-async/async.zsh'
plugin 'functions/misc.zsh'
plugin 'functions/trash.zsh'
plugin 'functions/xenv.zsh'

add_fpath 'third_party/zsh-completions'
add_fpath 'third_party/pure'

autoload -U promptinit; promptinit
prompt pure
