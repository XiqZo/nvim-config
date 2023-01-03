set number	
set relativenumber
set rnu
set linebreak	
set showbreak=+++ 
set textwidth=100
set showmatch	
set visualbell
set mouse=a
set showcmd

set hlsearch
set smartcase
set ignorecase	
set incsearch	
 
set autoindent	
set shiftwidth=4
set smartindent	
set smarttab	
set softtabstop=4	
set tabstop=4               " number of columns occupied by a tab 
set expandtab               " converts tabs to white space
set clipboard=unnamedplus 
set ruler	
 
set undolevels=1000	
set backspace=indent,eol,start	
 
set nocompatible            " disable compatibility to old-time vi
set wildmode=longest,list   " get bash-like tab completions
set cc=120                   " set an 80 column border for good coding style
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

let mapleader=","
syntax on
filetype plugin indent on   " allow auto-indenting depending on file type
filetype plugin on


call plug#begin()
" Theme
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
" Status
 Plug 'vim-airline/vim-airline'
" Motion
 Plug 'tmsvg/pear-tree'
 Plug 'scrooloose/nerdtree'
 Plug 'easymotion/vim-easymotion'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Extra
 Plug 'preservim/nerdcommenter'
 Plug 'vimwiki/vimwiki'
call plug#end()

" --------------------------------------------------------
" COC-VIM TAB SETTINGS START

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
let g:UltiSnipsExpandTrigger="<Nop>"
set completeopt=longest,menuone
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" COC-VIM TAB SETTINGS END
" --------------------------------------------------------

" --------------------------------------------------------
" NERDTree SETTINGS START
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree SETTINGS END
" --------------------------------------------------------


" Custom commands
autocmd InsertEnter * norm zz
