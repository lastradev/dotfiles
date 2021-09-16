-- TODO: add packer

require 'modules.config.dashboard'
require 'modules.config.lspInstall'
require 'modules.config.flutter-tools'
require 'modules.config.toggleterm'
require 'modules.config.gitsigns'
require 'modules.config.lspDiagnosticsSigns'
require 'modules.config.galaxyline'
require 'modules.config.dap'
require 'modules.config.lspsaga'
require 'modules.config.cmp'
require 'modules.config.completionItemKinds'
require 'modules.config.treesitter'
require 'dependency_assist'.setup()
require ("trouble").setup()
require ("which-key").setup()
require ("dapui").setup()
