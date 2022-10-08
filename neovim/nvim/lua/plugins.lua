local status, packer = pcall(require, 'packer')
if not status then
  print("Packer not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  use 'akinsho/nvim-bufferline.lua' -- Bufferline
  use 'hoob3rt/lualine.nvim' -- Statusline
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim' -- VSCode like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-autopairs' -- For autopairs symbols
  use 'windwp/nvim-ts-autotag' -- For auto completing tsx tags
  use 'nvim-lua/plenary.nvim' -- Common utilities required for running telescope
  use 'nvim-telescope/telescope.nvim' -- For Telescope skeleton
  use 'nvim-telescope/telescope-file-browser.nvim' -- For file browsing
end)
