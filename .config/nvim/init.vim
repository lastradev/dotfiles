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
Plug 'kabouzeid/nvim-lspinstall'
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
" Testing
Plug 'vim-test/vim-test'
" nvim tree
Plug 'kyazdani42/nvim-tree.lua'
" debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
" terminal
Plug 'akinsho/nvim-toggleterm.lua'
call plug#end()

colorscheme dracula
highlight CursorWord ctermbg=240 guibg=#363636

" FILE TREE
runtime ./plug-config/nvimtree.vim
" DASHBOARD
runtime ./plug-config/dashboard.vim
" MAPPINGS
runtime ./mappings.vim
" INDENT BLANKLINE
runtime ./plug-config/indent-blankline.vim
" COMMENTER
runtime ./plug-config/nerdcommenter.vim

lua << EOF
require 'plug-config.lspInstall'
require ("flutter-tools").setup {
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true
  }
}
require 'dependency_assist'.setup()
require 'plug-config.toggleterm'
require 'plug-config.gitsigns'
require ("trouble").setup()
require 'plug-config.compe'
require 'plug-config.lspDiagnosticsSigns'
require 'plug-config.completionItemKinds'
require 'plug-config.treesitter'
require ("which-key").setup()
require 'plug-config.galaxyline'
require 'plug-config.dap'
require ("dapui").setup()
local saga = require 'lspsaga'
saga.init_lsp_saga {
  code_action_prompt = {
    enable = false,
    sign = false,
    sign_priority = 20,
    virtual_text = true,
  },
}
EOF
