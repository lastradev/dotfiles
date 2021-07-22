set relativenumber
set clipboard=unnamedplus
set colorcolumn=80
set signcolumn=yes
set scrolloff=8
set incsearch
set nowrap
set noerrorbells
set hidden
set nohlsearch
set nu
set guicursor=
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nobackup
set undofile
set noswapfile
set updatetime=750
set shortmess+=c " removes pattern not found
set noshowmode
set cursorline
syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting

" " Always show the signcolumn, otherwise it would shift the text each time
"
" " diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
