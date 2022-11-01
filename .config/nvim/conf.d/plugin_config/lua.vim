lua << EOF
local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
lspconfig.texlab.setup{
  cmd = {'/opt/homebrew/bin/texlab'},
  build = {
  args = {
    "-pdfdvi",
    "-latex=uplatex",
    '-e "$dvipdf=\"dvipdfmx %O %S\"";',
    "-interaction=nonstopmode",
    "-synctex=1",
    "%f"
  },
  executable = "latexmk",
  forwardSearchAfter = false,
  onSave = false
  }
}
lspconfig.pyright.setup{}
require("todo-comments").setup{}
require('lualine').setup()
require('glow').setup()
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("fidget").setup()
require("nvim-treesitter.configs").setup {
  yati = { enable = true },
}
require("mason").setup()
require("mason-lspconfig").setup()
EOF
