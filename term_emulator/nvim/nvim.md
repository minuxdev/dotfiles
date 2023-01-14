# neovim plus lua

### inside `plugin.lua`

    local ensure_packer = function()
      local fn = vim.fn
      local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
      if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
      end
      return false
    end

    local packer_bootstrap = ensure_packer()

    return require('packer').startup(function(use)
      -- Packer can manage itself
      use 'wbthomason/packer.nvim'


      -- inside goes your plugins


    end)


## Plugins and configs

### file manager

    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'

#### configs
-- disable netwr (native file browser)

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- enable highlight groups
    vim.opt.termguicolors = true

    -- toggle NvimTreeToggle
    map("n", "<leader>n", ":NvimTreeToggle")




### highlighting
    use {
        'nvim-treesitter/nvim-treesitter', 
        {  'do', ':TSUpdate'},
    }


#### configs

    require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "python", "html", "vim", "css" },
        sysnc_install = false,
        auto_install = true,
        highlight = { enable = true },
    }



### finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua'/plenary.nvim'} } 
    }


### colorscheme
    use 'ellisonleao/gruvbox.nvim'
    use 'RRethy/nvim-base16'
    use 'joshdick/onedark.vim' "
        let g:onedark_termcolors=256
        let g:onedark_terminal_italics=1
        syntax on
        colorscheme onedark


### status bar

    use 'nvim-lualine/lualine.nvim'


### language server (lsp-zero)

    use 'davidhalter/jedi-vim' "update it with: git submodule update --init --recursive

      use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
        }
      }


  #### configs

    local lsp = require('lsp-zero')
    lsp.preset('recommended')

    --- adding lsp server
    lsp.ensure_installed({
        'sumneko_lua',
        'pyright'
    })

    lsp.set_preferences({
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      set_lsp_keymaps = true,
      configure_diagnostics = true,
      cmp_capabilities = true,
      manage_nvim_cmp = true,
      call_servers = 'local',
      sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
      }
    })

    vim.opt.signcolumn = 'yes'

    lsp.setup()






