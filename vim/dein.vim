let s:plugin_dir = expand('~/.vim/dein/')
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
let s:toml_dir = expand('$DOTFILE_PATH/vim/dein')
let s:nvim_dein = s:toml_dir . '/dein_nvim.toml'
let s:local_dein = s:toml_dir . '/dein_local.toml'

if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

execute 'set runtimepath^=' . s:dein_dir

call dein#begin(s:plugin_dir)
call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
if has('nvim') && filereadable(s:nvim_dein)
  call dein#load_toml(s:nvim_dein, {'lazy': 0})
endif
if filereadable(s:local_dein)
  call dein#load_toml(s:local_dein, {'lazy': 0})
endif
call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif

