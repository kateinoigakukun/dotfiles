set nocompatible
" -------------------------------------
"  vimのオプション
" -------------------------------------
set number
set ruler
set cursorline
set cursorcolumn
set laststatus=2
set cmdheight=2
set showmatch
set matchtime=1
set helpheight=999
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
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set clipboard=unnamed
set mouse=a
set shellslash
set wildmenu
set wildmode=list:longest,full
set history=10000
set visualbell
set t_vb=
set noerrorbells
set wrap
set display=lastline
set textwidth=0
set pumheight=10 
" dein.vimの設定
" -------------------------------------
let s:plugin_dir = expand('~/.vim/dein/')
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'

" dein.vimがないときはgit cloneする
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

execute 'set runtimepath^=' . s:dein_dir

call dein#begin(s:plugin_dir)

call dein#add('Shougo/dein.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('jiangmiao/auto-pairs')
call dein#add('tpope/vim-endwise')
call dein#add('keith/swift.vim')
call dein#add('ryutorion/vim-itunes')
call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" -------------------------------------
" themeの設定
" -------------------------------------
syntax enable
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let NERDTreeShowHidden = 1

nnoremap <Esc><Esc> :noh<CR>
nnoremap <C-h> 0
nnoremap <C-l> $
nnoremap <C-p> :call itunes#playpause()<CR>
nnoremap <C-n> :call itunes#next()<CR>
nnoremap <C-b> :call itunes#prev()<CR>
nnoremap <C-o> :NERDTreeToggle<CR>
