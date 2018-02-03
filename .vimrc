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
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11

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
execute 'set runtimepath^=' . expand('~/projects/')

call dein#begin(s:plugin_dir)

call dein#add('Shougo/dein.vim')
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
call dein#add('Shougo/deoplete.nvim')
call dein#add('slim-template/vim-slim')
call dein#add('tyru/open-browser.vim')
call dein#add('mattn/webapi-vim')
"重い
"call dein#add('vim-syntastic/syntastic')
call dein#add('kchmck/vim-coffee-script')
"call dein#add('landaire/deoplete-swift')
call dein#add('kateinoigakukun/deoplete-swift')
call dein#add('ConradIrwin/vim-bracketed-paste')
call dein#add('davidhalter/jedi-vim')
call dein#add('fishbullet/deoplete-ruby')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-rails')
call dein#add('dag/vim-fish')
call dein#add('kateinoigakukun/previm')
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')
call dein#add('tpope/vim-surround')
call dein#add('thinca/vim-quickrun')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('ujihisa/neco-ghc')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('eagletmt/ghcmod-vim')
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
if exists("neovim_dot_app")
    colorscheme solarized
    set background=dark
else
    set background=dark
    colorscheme solarized
    let g:solarized_termcolors=256
    let g:solarized_termtrans = 1
endif
let NERDTreeShowHidden = 1

nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap <C-g> :GitGutterLineHighlightsToggle<CR>

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#swift#source_kitten_binary = '/usr/local/bin/sourcekitten'
let g:deoplete#sources#swift#daemon_autostart = 1
let g:deoplete#sources#swift#sdk = '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk'
let g:deoplete#sources#swift#target = 'arm64-apple-ios10.0'
let g:jedi#force_py_version = 3
let g:python3_host_prog = $PYENV_ROOT . '/shims/python'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_autowrite = 1


inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Recommended key-mappings.

autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile Podfile set filetype=ruby
autocmd BufRead,BufNewFile Fastfile set filetype=ruby
autocmd FileType yaml set shiftwidth=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType sh set shiftwidth=2
autocmd FileType javascript set shiftwidth=2
nnoremap <C-e> :QuickRun<CR>
nnoremap <C-t> :GhcModType<CR>
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType markdown inoremap $ $$<ESC>i

let g:quickrun_config = {
\   "vim/async" : {
\       'command': 'vim',
\       'exec': '%C -N -u NONE -i NONE -V1 -e -s --cmd "source %s" --cmd qall!',
\       "runner" : "vimproc",
\       "hook/output_encode/encoding" : "sjis",
\   },
\}

let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 1

let g:previm_enable_realtime = 1
let g:previm_show_header = 0

set backupskip=/tmp/*,/private/tmp/*
let g:lightline = {
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


nnoremap <C-n> i<Return><Esc>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
let g:user_emmet_mode='n'

