
require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "python", "html", "vim", "css" },
    sysnc_install = false,
    auto_install = true,
    highlight = { enable = true },
}

