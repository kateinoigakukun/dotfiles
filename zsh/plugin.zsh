zsh_dir=$DOTFILE_PATH/zsh

function plugin() {
    source $zsh_dir/$1
}

function add_fpath() {
    fpath+=$zsh_dir/$1
}

plugin 'functions/misc.zsh'
plugin 'functions/trash.zsh'
