require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
