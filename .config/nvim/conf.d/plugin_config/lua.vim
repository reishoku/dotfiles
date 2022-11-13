lua << EOF
local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
local actions = require("telescope.actions")
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
-- require("todo-comments").setup{} -- This plugin has compatibility issue with nvim-treesitter-context (it seems)
require('lualine').setup()
require('glow').setup({pager = true, width = 120})
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("fidget").setup()
require("nvim-treesitter.configs").setup {
  yati = { enable = true },
  indent = {enable = true},
  highlight = {enable = true},
  incremental_selection = {enable = true},
  endwise = {enable = true},
}
require("twilight").setup{}
require("mason").setup()
require("mason-lspconfig").setup()
require("telescope").setup({
defaults = {
  mappings = {
    i = {
        ["<esc>"] = actions.close,
      },
    },
  },
})
require'nterm.main'.init({
  maps = true,  -- load defaut mappings
  shell = "fish",
  size = 20,
  direction = "horizontal", -- horizontal or vertical
  popup = 2000,     -- Number of miliseconds to show the info about the commmand. 0 to dissable
  popup_pos = "SE", --  one of "NE" "SE" "SW" "NW"
  autoclose = 0, -- If command is sucesful, close the terminal after that number of miliseconds. 0 to disable
})

-- Optional, if you want to use the telescope extension
require('telescope').load_extension('nterm')
EOF
