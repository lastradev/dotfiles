return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Common dependencies
  use {'nvim-lua/plenary.nvim'}

  -- Post-install/update hook with neovim command
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'modules.config.treesitter'
    end,
    run = ':TSUpdate'
  }

  -- Galaxyline
  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    config = function()
      require 'modules.config.galaxyline'
    end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
     require 'modules.config.gitsigns'
    end,
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  use {'tpope/vim-fugitive'}
  use {'tpope/vim-rhubarb'}
  use {
    'junegunn/gv.vim',
    requires = {
      {'tpope/vim-fugitive'}
    }
  }

  -- Auto pairs
  use {'jiangmiao/auto-pairs'}

  -- FZF
 	use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use {'junegunn/fzf.vim'}

  -- Undotree
  use {'mbbill/undotree'}

  -- Auto commenting
  use {'preservim/nerdcommenter'}

  -- HEX Colors
  use {'ap/vim-css-color'}

  -- Surround parenthesis and other symbols
  use {'tpope/vim-surround'}

  -- Dashboard
  use {
    'glepnir/dashboard-nvim',
    config = function()
      require 'modules.config.dashboard'
    end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'modules.config.lspInstall'
      -- require 'modules.config.lspDiagnosticsSigns'
    end,
    requires = {'kabouzeid/nvim-lspinstall'}
  }

  -- Polyglot for various languages syntax
  use {'sheerun/vim-polyglot'}

  use {
    'glepnir/lspsaga.nvim',
    config = function()
      require 'modules.config.lspDiagnosticsSigns'
    end
  }

  -- Quickfix trouble
  use {
    'folke/trouble.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require("trouble").setup{}
    end
  }

  -- Indentation lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require 'modules.config.indent-blankline'
    end
  }

  -- Whichkey
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup{}
    end
  }

  -- Cursor highlight
  use {'xiyaowong/nvim-cursorword'}

  -- Testing
  use {'vim-test/vim-test'}

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require 'modules.config.nvim-tree'
    end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Debugging
  use {
    'mfussenegger/nvim-dap',
    config = function()
      require 'modules.config.dap'
    end
  }
  use {
    'rcarriga/nvim-dap-ui',
    config = function()
      require ("dapui").setup{}
    end,
    requires = 'mfussenegger/nvim-dap'
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup{}
    end
  }

  -- Python formater
  use {'psf/black'}

  -- Flutter
  use {'dart-lang/dart-vim-plugin'}
  use {
    'akinsho/flutter-tools.nvim',
    config = function()
      require 'modules.config.flutter-tools'
    end,
    require = {
      {'dart-lang/dart-vim-plugin'},
      {'nvim-lua/plenary.nvim'}
    }
  }

  -- CMP and snippets
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require 'modules.config.cmp'
      require 'modules.config.completionItemKinds'
    end,
    requires = {
      "hrsh7th/vim-vsnip",
      'hrsh7th/vim-vsnip-integ',
      "hrsh7th/cmp-buffer",
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',
      'SirVer/ultisnips',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'onsails/lspkind-nvim'
    }
  }

  use {
    'Nash0x7E2/awesome-flutter-snippets',
    requires = {'hrsh7th/nvim-cmp'}
  }

  use {
    'mlaursen/vim-react-snippets',
    requires = {'hrsh7th/nvim-cmp'}
  }

  use {
    'honza/vim-snippets',
    requires = {'hrsh7th/nvim-cmp'}
  }

  -- Colorscheme
  use {'dracula/vim', as = 'dracula'}

  -- Personal snippets
  --use {
    --'~/.local/share/nvim/site/pack/packer/custom-snippets',
    --requires = {'hrsh7th/nvim-cmp'}
  --}
end)

