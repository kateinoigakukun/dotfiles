" Inherit .vimrc
execute 'source' expand('$DOTFILE_PATH') .'/.vimrc'

let g:deoplete#enable_at_startup = 1

let s:pyenv_shims = expand('$PYENV_ROOT/shims/')
if isdirectory(s:dein_dir)
  let g:python3_host_prog = s:pyenv_shims . 'python3'
endif
