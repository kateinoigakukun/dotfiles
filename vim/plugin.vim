let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 

call plug#begin()
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'EdJoJob/llvmir-vim', { 'for': 'llvm' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_autowrite = 1

Plug 'scrooloose/nerdtree'
let g:NERDTreeShowHidden = 1
nnoremap <C-o> :NERDTreeToggle<CR>

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZFFileList<CR>
command! FZFFileList call fzf#run(fzf#wrap({ 'source': 'git ls-files' }))

Plug 'github/copilot.vim'
let g:copilot_filetypes = { '*': v:true }

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'

Plug 'kateinoigakukun/swift-demangle-vim', { 'for': ['llvm', 'sil'] }
let g:swift_demangle#options = ['-compact']

call plug#end()

let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_verbose = 1
let g:lsp_show_message_log_level = 'log'
inoremap <expr> <cr>  pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <Tab> pumvisible() ? asyncomplete#close_popup() : "\<Tab>"

function! s:on_lsp_buffer_enabled() abort
  "note: avoid chattering by vim-lsp code action and diags
  setlocal signcolumn=yes
  setlocal omnifunc=lsp#complete
endfunction

autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

let s:swift_vim_utils_dir = expand('$LOCAL_SWIFT_SOURCE/utils/vim')
if isdirectory(s:swift_vim_utils_dir)
  execute 'set runtimepath^=' . s:swift_vim_utils_dir
endif

