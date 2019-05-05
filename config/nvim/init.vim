" Inherit .vimrc
execute 'source' expand('$DOTFILE_PATH') .'/.vimrc'

let s:pyenv_shims = expand('$PYENV_ROOT/shims/')
if isdirectory(s:dein_dir)
  let g:python3_host_prog = s:pyenv_shims . 'python3'
endif
