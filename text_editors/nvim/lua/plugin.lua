local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)




require("lazy").setup({
  -- LSP support
  "stevearc/conform.nvim",                                                                  -- Connect `null-ls` and `mason`
  { "neovim/nvim-lspconfig",                      event = { "BufReadPre", "BufNewFile" } }, -- For LSP configurations

  -- LSP UIs
  "glepnir/lspsaga.nvim",

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },                                 -- Changed 'requires' to 'dependencies' for lazy.nvim
    cmd = "Telescope",
  },                                                                                -- For searching
  { "nvim-telescope/telescope-file-browser.nvim", cmd = "Telescope file_browser" }, -- file browsing
  "nvim-tree/nvim-web-devicons",                                                    -- Icons
  "echasnovski/mini.icons",                                                         -- Icons

  -- code formater
  --  {
  --    "jose-elias-alvarez/null-ls.nvim", -- Adds extra tools that cannot act like LSP by themselves
  --  },
  "MunifTanjim/prettier.nvim", -- for code formater

  -- autocompletion
  { "hrsh7th/nvim-cmp",                event = "InsertEnter" }, -- completion engine
  "hrsh7th/cmp-nvim-lsp",                                       -- nvim-cmp source for neovimss built-in LSP
  "hrsh7th/cmp-buffer",                                         -- for buffer completions
  "hrsh7th/cmp-path",                                           --  for path completions
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      { "mlaursen/vim-react-snippets", opts = {} },
    }, -- Snippets engine
    event = "InsertEnter",
  },
  "onsails/lspkind-nvim",     -- vscode-like pictograms
  "saadparwaiz1/cmp_luasnip", -- allows nvim-cmp to use snippets loaded by LuaSnip

  -- actual snippets
  "rafamadriz/friendly-snippets", -- collection of snippets

  -- autotag and autopair
  { "windwp/nvim-autopairs",           event = "InsertEnter" },                  -- For auto close pairs of (), [], {}, , ""
  { "windwp/nvim-ts-autotag",          event = "InsertEnter" },                  --  for auto close, rename html like
  { "kylechui/nvim-surround",          event = { "BufReadPre", "BufNewFile" } }, --

  -- code highlights
  { "nvim-treesitter/nvim-treesitter", event = { "BufReadPost", "BufNewFile" } }, -- Code highlights

  -- lualine
  "nvim-lualine/lualine.nvim", -- Status and tabline

  -- colorscheme
  "RRethy/nvim-base16",                                                                             -- Colorschemes
  { "norcalli/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" } },                        -- Shows the color of the color code
  { "catppuccin/nvim",             name = "catppuccin",                          priority = 1000 }, -- colorscheme catppuccin
  { "pangloss/vim-javascript",     ft = { "javascript", "javascriptreact" } },                      -- Prettify .jsx files
  { "MaxMEllon/vim-jsx-pretty",    ft = { "javascriptreact", "typescriptreact" } },                 -- Prettify .jsx files
  "JoosepAlviste/nvim-ts-context-commentstring",                                                    -- Commentstring integration with treesitter

  -- Comment
  { "numToStr/Comment.nvim",    event = { "BufReadPre", "BufNewFile" } }, -- Commenter
  { "echasnovski/mini.comment", event = { "BufReadPre", "BufNewFile" } }, -- Commenter (Fixed repository organization name)

  -- Surounding
  { "tpope/vim-surround",       event = { "BufReadPre", "BufNewFile" } }, -- surrounding words

  -- RegExp
  { "nvim-pack/nvim-spectre",   cmd = "Spectre" }, -- enhance RegExp operations

  "mg979/vim-visual-multi",                        -- Multi cursors like Alt-click in vs-code

  -- which-key
  { "folke/which-key.nvim", event = "VeryLazy" }, -- to show hot-keys

  -- Command Mode
  {
    "gelguy/wilder.nvim",
    lazy = false,
    priority = 100,
    build = ":UpdateRemotePlugins",
    config = function()
      local wilder = require("wilder")
      wilder.setup({
        modes = { ":", "/", "?" },
      })
    end,
  },

  -- Go language
  { "ray-x/go.nvim",        ft = "go" }, -- Add go support to neovim
})
