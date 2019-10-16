set number
set laststatus=2
set cmdheight=2
set showmatch
set matchtime=1
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set wrap
set confirm
set autoread
set nobackup
set backupskip=/tmp/*,/private/tmp/*
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set smartindent
set shiftwidth=4
set clipboard=unnamed
set clipboard+=unnamedplus
set wildmenu
set visualbell
set timeout timeoutlen=0
"  Ignore beep
set t_vb=
set noerrorbells

set display=lastline
set textwidth=0
set pumheight=10
set nofoldenable
"  Disable matchparen for performance
let g:loaded_matchparen = 1

filetype plugin indent on
execute 'source' expand('$DOTFILE_PATH') .'/vim/dein.vim'

syntax enable
set t_Co=256

autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile Podfile set filetype=ruby
autocmd BufRead,BufNewFile Fastfile set filetype=ruby
autocmd BufRead,BufNewFile *.sil set filetype=sil
autocmd BufRead,BufNewFile *.ll set filetype=llvm
autocmd FileType yaml set shiftwidth=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType sh set shiftwidth=2
autocmd FileType c set shiftwidth=2
autocmd FileType javascript set shiftwidth=2
autocmd FileType json set shiftwidth=2
autocmd FileType html set shiftwidth=2
autocmd FileType tex set shiftwidth=2
autocmd FileType markdown set shiftwidth=2
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType markdown inoremap $ $$<ESC>i
autocmd FileType haskell nnoremap <C-t> :GhcModType<CR>
autocmd FileType sil nnoremap <C-t> :SwiftDemangle<CR>
autocmd FileType llvm nnoremap <C-t> :SwiftDemangle<CR>
autocmd FileType swift set expandtab
autocmd FileType swift setlocal omnifunc=lsp#complete

let s:local_vimrc = expand('$HOME/.vimrc.local')
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif
