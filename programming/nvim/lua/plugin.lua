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

	use("nvim-tree/nvim-tree.lua") -- File browser
	use("nvim-tree/nvim-web-devicons") -- Icons
	use("nvim-lualine/lualine.nvim") -- Status and tabline

	use("RRethy/nvim-base16") -- Colorschemes
	use("norcalli/nvim-colorizer.lua") -- Shows the color of the color code
	use({ "AlphaTechnolog/pywal.nvim", as = "pywal" })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	}) -- For searching

	use({
		"williamboman/mason.nvim", -- Portable package manager for installing LSP, DAP, Linters and Formatters
		"williamboman/mason-lspconfig.nvim", -- Connect mason.vim and lspconfig
		"jay-babu/mason-null-ls.nvim", -- Connect `null-ls` and `mason`
		"neovim/nvim-lspconfig", -- For LSP configurations
	})

	use({
		"jose-elias-alvarez/null-ls.nvim", -- Adds extra tools that cannot act like LSP by themselves
	})

	use("nvim-treesitter/nvim-treesitter") -- Code highlights
	use("mg979/vim-visual-multi") -- Multi cursors like 'Alt-click' in 'vs-code'

	-- Autocompletion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip") -- Snippets engine
	use("saadparwaiz1/cmp_luasnip") -- LuaSnip completion
	use("rafamadriz/friendly-snippets") -- Snippets collection
	use("ray-x/lsp_signature.nvim") -- To show function signuture on type like
	use("windwp/nvim-autopairs") -- For auto close pairs of (), [], {}, '', ""

	use("pangloss/vim-javascript")

	-- HTML support
	use({
		"othree/html5.vim",
		run = " npm install -g vscode-langservers-extracted ",
	})
	use("AndrewRadev/tagalong.vim") -- Auto rename html tags

	-- Comment
	use("scrooloose/nerdcommenter") -- Commenter

	use("markstory/vim-zoomwin") -- Pane zoom

	if packer_bootstrap then
		require("packer").sync()
	end
end)
