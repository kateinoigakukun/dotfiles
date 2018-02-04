set nocompatible " -------------------------------------
"  vimのオプション
" -------------------------------------
set number
set ruler
"重くなる要因 無くても困らない
"set cursorline
set cursorcolumn
set laststatus=2
set statusline=2
set cmdheight=2
set showmatch
set matchtime=0
set helpheight=10
set list
set listchars=tab:▸\ ,trail:-,nbsp:%,extends:>,precedes:<,eol:↩︎
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
set sidescrolloff=16
set sidescroll=1
set wrap
set hidden
set confirm
set autoread
set nobackup
set backupskip=/tmp/*,/private/tmp/*
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault
set expandtab
set tabstop=2
set shiftwidth=4
set softtabstop=2
set autoindent
set smartindent
set clipboard=unnamed
set mouse=n
set shellslash
set wildmenu
set wildignorecase
set wildmode=list:longest,full
set history=10000
set visualbell
set timeout timeoutlen=0
"  ビープ音を消す
set t_vb=
set noerrorbells

set display=lastline
set textwidth=0
set pumheight=10 

" dein.vimの設定
" -------------------------------------
let s:plugin_dir = expand('~/.vim/dein/')
let s:toml_dir = expand('~/dotfiles/vim')
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'

" dein.vimがないときはgit cloneする
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

execute 'set runtimepath^=' . s:dein_dir
execute 'set runtimepath^=' . expand('~/projects/')

call dein#begin(s:plugin_dir)
call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" -------------------------------------
" themeの設定
" -------------------------------------
syntax enable
set t_Co=256
if exists("neovim_dot_app")
    colorscheme solarized
    set background=dark
else
    set background=dark
    colorscheme solarized
    let g:solarized_termcolors=256
    let g:solarized_termtrans = 1
endif

let g:deoplete#enable_at_startup = 1
let g:unite_enable_start_insert=1
let g:python3_host_prog = $PYENV_ROOT . '/shims/python'

" Recommended key-mappings.

autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile Podfile set filetype=ruby
autocmd BufRead,BufNewFile Fastfile set filetype=ruby
autocmd FileType yaml set shiftwidth=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType sh set shiftwidth=2
autocmd FileType javascript set shiftwidth=4
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType markdown inoremap $ $$<ESC>i
autocmd FileType haskell nnoremap <C-t> :GhcModType<CR>

nnoremap <C-e> :QuickRun<CR>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

