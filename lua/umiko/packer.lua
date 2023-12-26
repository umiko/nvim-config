-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  
  -- Color Scheme
  --	use('rebelot/kanagawa.nvim')
  --  use('folke/tokyonight.nvim')
  use { "catppuccin/nvim", as = "catppuccin" }
  
  -- Lua Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = false }
  }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },       -- Required
      {                                  -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },       -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },           -- Required
      { 'hrsh7th/cmp-nvim-lsp' },       -- Required
      { 'L3MON4D3/LuaSnip' },           -- Required
    }
  }

  -- cmake tools
  use { 'Civitasv/cmake-tools.nvim',
    requires = {
      { "nvim-lua/plenary.nvim" },
    }
  }
  -- Eunuch
  use('tpope/vim-eunuch')

  -- buffer manager
  use('j-morano/buffer_manager.nvim')

  use { 'kkoomen/vim-doge',
    run = ':call doge#install()'
  }
  -- Packer
  use { 'dgagn/diagflow.nvim' }
  -- trouble
  use('folke/trouble.nvim')
  if packer_bootstrap then
    require('packer').sync()
  end
end)
