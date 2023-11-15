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
  use 'wbthomason/packer.nvim'

  -- Initial plugins
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- Line
  use 'nvim-lualine/lualine.nvim'
  use {
    'vim-airline/vim-airline',
    requires = { { 'vim-airline/vim-airline-themes' } }
  }

  -- Colorscheme
  use {
    'ellisonleao/gruvbox.nvim',
    'RRethy/nvim-base16',
    'joshdick/onedark.vim'
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Language Server Protocol
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    run = ' pip3 install neovim ',
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    run = ' npm install prettier ; pip3 install black'
  }

  -- formatters
  use {
    'nvie/vim-flake8',
    run = 'pip3 install flake8'
  }
  use 'tpope/vim-haml'

  -- For programming
  use 'nvim-treesitter/nvim-treesitter'
  --use 'github/copilot.vim'
  use 'FooSoft/vim-argwrap'
  use 'lukas-reineke/lsp-format.nvim'
  use 'mg979/vim-visual-multi'

  -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- SCSS support
  use {
    'cakebaker/scss-syntax.vim',
    run = ' npm install -g vscode-langservers-extracted '
  }
  use 'hail2u/vim-css3-syntax'
  use 'pangloss/vim-javascript'

  -- HTML support
  use 'othree/html5.vim'

  -- Comment
  use 'scrooloose/nerdcommenter'

  -- Tabline
  use {
    'romgrk/barbar.nvim',
    'lewis6991/gitsigns.nvim',
  }


  if packer_bootstrap then
    require('packer').sync()
  end
end)
