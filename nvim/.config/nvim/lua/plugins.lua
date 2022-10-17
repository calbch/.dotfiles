local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local ready, packer = pcall(require, "packer")
if not ready then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use {
    "wbthomason/packer.nvim",
    "lewis6991/impatient.nvim",
    "nathom/filetype.nvim", -- replaces 800+ autocommands of filetype.vim with a single autocommand
    "nvim-lua/plenary.nvim", -- lib of lua functions; used by telescope, gitsigns,..
    "nvim-lua/popup.nvim", -- enables vim like popups
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "neovim/nvim-lspconfig",
      requires = {
        "b0o/schemastore.nvim",
        "folke/neodev.nvim",
      }
    },
    "jose-elias-alvarez/null-ls.nvim", -- null-ls
    "glepnir/lspsaga.nvim",
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp", -- The completion plugin
    requires = {
      {
        "L3MON4D3/LuaSnip", --snippet engine
        requires = {
          "rafamadriz/friendly-snippets", -- a bunch of snippets to use
        },
      },
      { "hrsh7th/cmp-nvim-lsp" }, -- lsp completion
      { "hrsh7th/cmp-buffer" }, -- buffer completions
      { "hrsh7th/cmp-nvim-lua" }, -- nvim lua api completion
      { "hrsh7th/cmp-path" }, -- path completion
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" }, -- lua snippet completion
      { "onsails/lspkind.nvim" },
    },
  }

  -- Search
  use {
    { "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "telescope-fzf-native.nvim",
        "telescope-file-browser.nvim"
      },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    "nvim-telescope/telescope-file-browser.nvim" -- Telescope File Browser}
  }

  -- Treesitter
  use {
    { "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    },
    {
      "windwp/nvim-autopairs",
    },
    {
      "windwp/nvim-ts-autotag",
    },
  }

  -- UI
  use "kyazdani42/nvim-web-devicons" -- used for multiple plugins
  use { "folke/tokyonight.nvim" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use "nvim-lualine/lualine.nvim"

  -- Bufferline
  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Indent Blankline
  use {
    "lukas-reineke/indent-blankline.nvim",
  }

  -- Presence
  use {
    "andweeb/presence.nvim",
    config = [[require'lazy-load.presence']],
    event = "UIEnter *"
  }

  -- Comment
  use "numToStr/Comment.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- debugging
  use "mfussenegger/nvim-dap"

  use "dstein64/vim-startuptime"

  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
