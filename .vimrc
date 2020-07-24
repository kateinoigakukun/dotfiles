set backspace=indent,eol,start
set wrap
set confirm
set autoread
set directory=/tmp
set backupdir=/tmp
set hlsearch
set ignorecase
set smartcase
set autoindent
set smartindent
set shiftwidth=4
set clipboard=unnamed
set wildmenu

set pumheight=10

filetype plugin indent on
execute 'source' expand('$DOTFILE_PATH') .'/vim/dein.vim'

syntax enable

autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile Podfile set filetype=ruby
autocmd BufRead,BufNewFile Fastfile set filetype=ruby
autocmd BufRead,BufNewFile *.sil set filetype=sil
autocmd BufRead,BufNewFile *.ll set filetype=llvm
autocmd FileType yaml set shiftwidth=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType sh set shiftwidth=2
autocmd FileType c set shiftwidth=2
autocmd FileType c set expandtab
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
autocmd FileType wast set shiftwidth=2
autocmd FileType wast set tabstop=2

let s:local_vimrc = expand('$HOME/.vimrc.local')
if filereadable(s:local_vimrc)
  execute 'source' s:local_vimrc
endif
