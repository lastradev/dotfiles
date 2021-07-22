runtime ./settings.vim

call plug#begin('/nvim-conf/plugged')
" Theme
Plug 'dracula/vim', { 'as': 'dracula' }
" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" Autopairs
Plug 'jiangmiao/auto-pairs'
" Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'
" Status Line
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
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
Plug 'glepnir/dashboard-nvim'
" Vim snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'
" Completion
Plug 'hrsh7th/nvim-compe'
" LSP gui
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
" Lua support
Plug 'nvim-lua/plenary.nvim'
" Vim game
Plug 'ThePrimeagen/vim-be-good'
" Trouble
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" Git signs
Plug 'lewis6991/gitsigns.nvim'
" indent lines
Plug 'lukas-reineke/indent-blankline.nvim'
" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Whichkey
Plug 'folke/which-key.nvim'
Plug '/nvim-conf/plugged/custom-flutter-snippets'
" Cursor highlight
Plug 'xiyaowong/nvim-cursorword'
" Pubspec assist
Plug 'akinsho/dependency-assist.nvim'
" Smooth scroll
Plug 'karb94/neoscroll.nvim'
" Testing
Plug 'vim-test/vim-test'
" nvim tree
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

colorscheme dracula
highlight CursorWord ctermbg=240 guibg=#363636

" FILE TREE
runtime ./plug-config/nvimtree.vim
" DASHBOARD
runtime ./plug-config/dashboard.vim
" COMMENTER
runtime ./plug-config/nerdcommenter.vim
" INDENT BLANKLINE
runtime ./plug-config/indent-blankline.vim
" MAPPINGS
runtime ./mappings.vim

lua << EOF
require("flutter-tools").setup{}
require'lspconfig'.tsserver.setup{}
require'dependency_assist'.setup{}
require('neoscroll').setup()
require('lspfuzzy').setup {}
require 'plug-config.gitsigns'
require("trouble").setup {}
require 'plug-config.compe'
require 'plug-config.lspDiagnosticsSigns'
require 'plug-config.completionItemKinds'
require 'plug-config.treesitter'
require("which-key").setup {}
require 'plug-config.galaxyline'
EOF
