runtime ./plug-config/signify.vim
runtime ./plug-config/nerdtree.vim

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
set relativenumber
set guicursor=
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nobackup
set undofile
set noswapfile
set undodir=~/.config/nvim/undodir
syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting
set updatetime=750
set shortmess+=c " for CoC plugin
set noshowmode
set cursorline

colorscheme gruvbox

call plug#begin('/nvim-conf/plugged')
" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" Flutter Custom settings
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
" Nerd Tree
Plug 'preservim/nerdtree'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons'
" Theme
Plug 'morhetz/gruvbox'
" Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Status Line
Plug 'itchyny/lightline.vim'
" Code completion
Plug 'sheerun/vim-polyglot'
" Undotree
Plug 'mbbill/undotree'
" Nerd Commenter
Plug 'preservim/nerdcommenter'
" Vim CSS Color
Plug 'ap/vim-css-color'
" Vim Surround
Plug 'tpope/vim-surround'
"Vim Startify
Plug 'mhinz/vim-startify'
" Vim snippets
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'Neevash/awesome-flutter-snippets'
" Vim game
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

let mapleader = " "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <leader>e :NERDTreeToggle<cr>
nnoremap <leader>fs :CocCommand flutter.run<cr>
nnoremap <leader>fq :CocCommand flutter.dev.quit<cr>
nnoremap <leader>fr :CocCommand flutter.dev.hotReload<cr>
nnoremap <leader>fR :CocCommand flutter.dev.hotRestart<cr>
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>
nnoremap <leader>fo :Format<cr>
nnoremap <leader>u :UndotreeShow<CR>

" Useful for closing parenthesis
inoremap <C-l> <Right>

"Autocompletion config
" COC
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
inoremap <silent><expr> <c-space> coc#refresh()
let g:coc_user_config = {}
let g:coc_global_extensions = [
      \ 'coc-emmet', 
      \ 'coc-css', 
      \ 'coc-html', 
      \ 'coc-json', 
      \ 'coc-phpls', 
      \ 'coc-python', 
      \ 'coc-prettier', 
      \ 'coc-tsserver', 
      \ 'coc-snippets', 
      \ 'coc-flutter', 
      \ 'coc-yaml', 
      \ 'coc-eslint']

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" " Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" " Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" " Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Nerd Commenter
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Map ++ to call NERD Commenter and use iTerm key bindings
" " to bind Ctmd+/ to ++
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"Fuzzy Search config
nnoremap <leader>ps :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Lightline
let g:lightline = {
  \     'colorscheme': 'gruvbox',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     },
  \ }

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
" " Line moving
" "  Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" " Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" " Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Exit insert mode
inoremap <A-q> <Esc>
vnoremap <A-q> <Esc>
cnoremap <A-q> <Esc>
" Map Y to y$
nnoremap Y y$

let g:ascii = [
      \'                  o    ',
      \'       _=,_     o      ',
      \'    o_/6 /#\  o        ',
      \'    \__ |##/          ',
      \'     ="|--\           ',
      \'       /   #"-.       ', 
      \'       \#|_   _"-. /  ',
      \'        |/ \_( # |"   ',
      \'       C/ ,--___/     ',
      \''
      \]
let g:startify_custom_header =
      \ startify#pad(startify#fortune#boxed() + g:ascii )

