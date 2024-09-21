" Inherit .vimrc
let s:vimrc = expand('$DOTFILES_PATH') .'/.vimrc'
if filereadable(s:vimrc)
  execute 'source' s:vimrc
endif

let s:pyenv_shims = expand('$PYENV_ROOT/shims/')
if isdirectory(s:pyenv_shims)
  let g:python3_host_prog = s:pyenv_shims . 'python3'
endif
