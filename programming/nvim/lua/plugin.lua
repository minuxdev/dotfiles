local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- LSP support
	use({
		"williamboman/mason.nvim", -- Portable package manager for installing LSP, DAP, Linters and Formatters
		"williamboman/mason-lspconfig.nvim", -- Connect mason.vim and lspconfig
		"jay-babu/mason-null-ls.nvim", -- Connect `null-ls` and `mason`
		"neovim/nvim-lspconfig", -- For LSP configurations
	})

	-- LSP UIs
	use("glepnir/lspsaga.nvim")

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	}) -- For searching
	use("nvim-telescope/telescope-file-browser.nvim") -- file browsing
	use("nvim-tree/nvim-web-devicons") -- Icons

	-- code formater
	use({
		"jose-elias-alvarez/null-ls.nvim", -- Adds extra tools that cannot act like LSP by themselves
	})
	use("MunifTanjim/prettier.nvim") -- for code formater

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion engine
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovimss built-in LSP
	use("hrsh7th/cmp-buffer") -- for buffer completions
	use("hrsh7th/cmp-path") --  for path completions
	use("L3MON4D3/LuaSnip") -- Snippets engine
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("saadparwaiz1/cmp_luasnip") -- allows nvim-cmp to use snippets loaded by LuaSnip

	-- actual snippets
	use("rafamadriz/friendly-snippets") -- collection of snippets

	-- autotag and autopair
	use("windwp/nvim-autopairs") -- For auto close pairs of (), [], {}, , ""
	use("windwp/nvim-ts-autotag") --  for auto close, rename html like

	-- code highlights
	use("nvim-treesitter/nvim-treesitter") -- Code highlights

	-- lualine
	use("nvim-lualine/lualine.nvim") -- Status and tabline

	-- colorscheme
	use("RRethy/nvim-base16") -- Colorschemes
	use("norcalli/nvim-colorizer.lua") -- Shows the color of the color code
	--use({ "AlphaTechnolog/pywal.nvim", as = "pywal" })

	-- Comment
	use("numToStr/Comment.nvim") -- Commenter

	-- Surounding
	use("tpope/vim-surround") -- surrounding words

	-- RegExp
	use("nvim-pack/nvim-spectre") -- enhance RegExp operations

	use("mg979/vim-visual-multi") -- Multi cursors like Alt-click in vs-code

	-- Zooming
	use("markstory/vim-zoomwin") -- Pane zoom

	-- which-key
	use("folke/which-key.nvim") -- to show hot-keys

	-- Command Mode
	use("gelguy/wilder.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
