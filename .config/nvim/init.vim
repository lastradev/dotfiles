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
syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting
set updatetime=750
set shortmess+=c " removes pattern not found
set noshowmode
set cursorline


call plug#begin('/nvim-conf/plugged')
" Flutter
Plug 'dart-lang/dart-vim-plugin'
" Git
" Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" Nerd Tree
Plug 'preservim/nerdtree'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons'
" Flutter Custom settings
Plug 'jiangmiao/auto-pairs'
" Theme
Plug 'morhetz/gruvbox'
" Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Status Line
Plug 'hoob3rt/lualine.nvim'
" Plug 'itchyny/lightline.vim'
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
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'
" Completion
Plug 'hrsh7th/nvim-compe'
" LSP gui
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
" Flutter tools
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim'
" Vim game
Plug 'ThePrimeagen/vim-be-good'
" Material
Plug 'marko-cerovac/material.nvim'
" Trouble
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" Git signs
Plug 'lewis6991/gitsigns.nvim'
" indent lines
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
call plug#end()

runtime ./plug-config/nerdtree.vim
let g:material_style = 'darker'

colorscheme material

let mapleader = " "
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <leader>e :NERDTreeToggle<cr>


" " Always show the signcolumn, otherwise it would shift the text each time
"
" " diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" NERD COMMENTER
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


" REMAPS
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
" Map Y to y$
nnoremap Y y$
" Useful for closing parenthesis
inoremap <C-l> <Right>
" Flutter commands
nnoremap <leader>fs :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterReload>
nnoremap <leader>fR :FlutterRestart<cr>
nnoremap <leader>fe :FlutterEmulators<CR>
" nnoremap <leader>fd :below new output:///flutter-dev <CR>
nnoremap <leader>fd :below new __FLUTTER_DEV_LOG__<CR>
nnoremap <leader>fo :lua vim.lsp.buf.formatting()<cr>
nnoremap <leader>u :UndotreeShow<CR>
" Necessary for lsp to update diagnostics
inoremap <C-c> <esc>

"STARTIFY CUSTOM HEADER
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

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

highlight link CompeDocumentation NormalFloat

" AUTO DART FORMAT
let g:dart_format_on_save = 1

" LSP SAGA
" LspSagaFinder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
" code action
nnoremap <silent><leader>a :Lspsaga code_action<CR>
vnoremap <silent><leader>a :<C-U>Lspsaga range_code_action<CR>
" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" show signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>
" rename
nnoremap <leader>rn :Lspsaga rename<CR>
" Preview definition
nnoremap <silent> gd :Lspsaga preview_definition<CR>
" Show diagnostics
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" Jump diagnostics
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
" Trouble 
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

lua << EOF

require("flutter-tools").setup{}

require('lualine').setup{
  options = {
    theme = 'material-nvim'
  }
}

require('gitsigns').setup()

require("trouble").setup {}

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = {kind = "   (Path)"},
        buffer = {kind = "   (Buffer)"},
        calc = {kind = "   (Calc)"},
        vsnip = {kind = "   (Snippet)"},
        nvim_lsp = {kind = "   (LSP)"},
        -- nvim_lua = {kind = "  "},
		    nvim_lua = false,
        spell = {kind = "   (Spell)"},
        tags = false,
        vim_dadbod_completion = true,
        -- snippets_nvim = {kind = "  "},
        -- ultisnips = {kind = "  "},
        -- treesitter = {kind = "  "},
        emoji = {kind = " ﲃ  (Emoji)", filetypes={"markdown", "text"}}
        -- for emoji press : (idk if that in compe tho)
    }
}

-- TAB IN AUTOCOMPLETION
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)",
}

require'compe'.setup{
  source={
          path = {kind = "   (Path)"},
          buffer = {kind = "   (Buffer)"},
          calc = {kind = "   (Calc)"},
          vsnip = {kind = "   (Snippet)"},
          nvim_lsp = {kind = "   (LSP)"},
          -- nvim_lua = {kind = "  "},
          nvim_lua = false,
          spell = {kind = "   (Spell)"}
  }
}
EOF
