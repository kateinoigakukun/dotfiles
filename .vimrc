set backspace=indent,eol,start
set confirm
set autoread
set directory=/tmp
set backupdir=/tmp
set hlsearch
set ignorecase
set smartcase
set autoindent
set smartindent
set clipboard=unnamed
set wildmenu
set pumheight=10
set shiftwidth=2
set nofoldenable
set expandtab

set grepprg=git\ grep\ -I\ --line-number

filetype plugin indent on

let s:plugin_script = expand('$DOTFILES_PATH') .'/vim/plugin.vim'
if filereadable(s:plugin_script)
  execute 'source' s:plugin_script
endif

syntax enable

augroup set_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile Podfile set filetype=ruby
  autocmd BufRead,BufNewFile Fastfile set filetype=ruby
  autocmd BufRead,BufNewFile *.sil set filetype=sil
  autocmd BufRead,BufNewFile *.ll set filetype=llvm
  autocmd BufRead,BufNewFile *.swift set filetype=swift
  autocmd BufRead,BufNewFile *.nix set filetype=nix
  autocmd BufRead,BufNewFile *.bazel set filetype=bzl
augroup END

let s:local_vimrc = expand('$HOME/.vimrc.local')
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif
