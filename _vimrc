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
set timeout timeoutlen=0
"set termguicolors
"  ビープ音を消す
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
"call dein#add('altercation/vim-colors-solarized')
call dein#add('altercation/vim-colors-solarized')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('jiangmiao/auto-pairs')
call dein#add('tpope/vim-endwise')
call dein#add('keith/swift.vim')
call dein#add('ryutorion/vim-itunes')
"if !has('nvim')
  call dein#add('Shougo/neocomplete')
"endif
call dein#add('Shougo/deoplete.nvim')
call dein#add('mitsuse/autocomplete-swift')
call dein#add('slim-template/vim-slim')
call dein#add('tyru/open-browser.vim')
call dein#add('minerva1129/previm')
call dein#add('mattn/webapi-vim')
call dein#add('vim-syntastic/syntastic')
call dein#add('kchmck/vim-coffee-script')
call dein#add('landaire/deoplete-swift')
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
nnoremap <C-p> :call itunes#playpause()<CR>
nnoremap <C-n> :call itunes#next()<CR>
nnoremap <C-b> :call itunes#prev()<CR>
nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap <C-h> :!echo `/Users/yuutas4/.rbenv/shims/haml %` > result.html<CR>

"" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Recommended key-mappings.

autocmd BufRead,BufNewFile *.md set filetype=markdown
" Jump to the first placeholder by typing `<C-k>`.
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)


let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a "Firefox"'
let g:previm_show_header = 0
set backupskip=/tmp/*,/private/tmp/*

nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <C-n> i<Return><Esc>
