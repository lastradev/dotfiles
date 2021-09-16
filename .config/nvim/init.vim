lua << EOF
require 'core.options'
EOF

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
" Vim snippets and completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Nash0x7E2/awesome-flutter-snippets'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-emoji'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" Kind in snippets
Plug 'onsails/lspkind-nvim'
" LSP gui
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
" Lua support
Plug 'nvim-lua/plenary.nvim'
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
" Testing
Plug 'vim-test/vim-test'
" nvim tree
Plug 'kyazdani42/nvim-tree.lua'
" debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
" terminal
Plug 'akinsho/nvim-toggleterm.lua'
" Python formater
Plug 'psf/black'
call plug#end()

" FILE TREE
runtime ./plug-config/nvimtree.vim
" INDENT BLANKLINE
runtime ./plug-config/indent-blankline.vim
" COMMENTER
runtime ./plug-config/nerdcommenter.vim

lua << EOF
require 'modules'
require 'core.keymaps'
require 'core.colors'
EOF
