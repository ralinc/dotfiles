vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
  syntax on
  filetype plugin indent on
  colorscheme jellybeans
]])

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.md", command = "setl filetype=markdown" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.slim", command = "setl filetype=slim" })
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "setl spell nolist wrap lbr textwidth=80" })
vim.api.nvim_create_autocmd("FileType", { pattern = { "gitcommit" }, command = "setl spell textwidth=72" })

require("keybindings")
require("options")
require("plugins")
