
vim.opt.encoding = 'utf-8'
vim.opt.mouse = 'a'
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 6
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.copyindent = true
vim.opt.breakindent = true
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.expandtab = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.wrapscan = true
vim.opt.wrap = true
vim.opt.autochdir = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.laststatus = 2
vim.opt.paste = true
vim.opt.showtabline = 2

vim.opt.wildignore:append('*.o')
vim.opt.wildignore:append('*.obj')
vim.opt.wildignore:append('*.swp')
vim.opt.wildignore:append('*.rpm')
vim.opt.wildignore:append('*.tar.gz')
vim.opt.wildignore:append('*.tar')
vim.opt.wildignore:append('*.zip')
vim.opt.wildignore:append('*.gz')
vim.opt.wildignore:append('*.*~')
vim.opt.wildignore:append('*.bak')
vim.opt.wildignore:append('*.log')
vim.opt.wildignore:append('*.tmp')
vim.opt.wildignore:append('*.dmg')
vim.opt.wildignore:append('node_modules')
vim.opt.wildignore:append('*.code-workspace')
vim.opt.wildignore:append('.vscode')
vim.opt.wildignore:append('.git')
vim.opt.wildignore:append('.DS_Store')
vim.opt.wildignore:append('Thumbs.db')
vim.opt.wildignore:append('desktop.ini')
vim.opt.wildignore:append('@eaDir')
vim.opt.wildignore:append('.venv')
vim.opt.wildignore:append('.localized')
vim.opt.wildignore:append('.*.pyc')
vim.opt.wildignore:append('site-package')
vim.opt.wildignore:append('site-packages')
vim.opt.completeopt = 'menuone,noinsert,popup,fuzzy,noselect'
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.whichwrap = { ["<"] = true, [">"] = true, ["["] = true, ["]"] = true, b = true, s = true, ["~"] = true }
vim.opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
-- vim.opt.completeopt = { "@", "48-57", "_", "192-255", "-" }
vim.opt.clipboard:append({unnamedplus = true})

-- vim.log.levels = vim.log.levels.OFF
-- vim.lsp.log_levels = vim.log.levels.OFF

vim.api.nvim_set_keymap('n', 'q', '<nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true, silent = true})

-- vim.g.python3_host_prog = '/Users/reishoku/.local/virtualenvs/pynvim/bin/python3'
-- vim.g.node_host_prog = '/Users/reishoku/.local/npm/bin/neovim-node-host'

-- vim-plug
-- sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug('junegunn/vim-plug')
  Plug('nvim-tree/nvim-web-devicons')
  Plug('nvim-treesitter/nvim-treesitter')
  Plug('neovim/nvim-lspconfig')
  Plug('ms-jpq/coq_nvim', {branch='coq'})
  Plug('ms-jpq/coq.artifacts', {branch='artifacts'})
  Plug('ms-jpq/coq.thirdparty', {branch='3p'})
  Plug('fuenor/JpFormat.vim')
  Plug('tomasr/molokai')
  Plug('windwp/nvim-autopairs')
  Plug('folke/todo-comments.nvim')
  Plug('yioneko/nvim-yati')
  Plug('Wansmer/treesj')
  Plug('kdheepak/lazygit.nvim')
  Plug('dag/vim-fish')
  Plug('neomutt/neomutt.vim')
  Plug('preservim/vim-markdown')
  Plug('folke/trouble.nvim')
  -- Plug('sheerun/vim-polyglot')
vim.call('plug#end')

vim.diagnostic.config({virtual_lines=true})

require('nvim-web-devicons').setup({default = true })

require('treesj').setup{
  ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
  use_default_keymaps = true,
  ---@type boolean Node with syntax error will not be formatted
  check_syntax_error = true,
  ---If line after join will be longer than max value,
  ---@type number If line after join will be longer than max value, node will not be formatted
  max_join_length = 120,
  ---Cursor behavior:
  ---hold - cursor follows the node/place on which it was called
  ---start - cursor jumps to the first symbol of the node being formatted
  ---end - cursor jumps to the last symbol of the node being formatted
  ---@type 'hold'|'start'|'end'
  cursor_behavior = 'hold',
  ---@type boolean Notify about possible problems or not
  notify = true,
  ---@type boolean Use `dot` for repeat action
  dot_repeat = true,
  ---@type nil|function Callback for treesj error handler. func (err_text, level, ...other_text)
  on_error = nil,
  ---@type table Presets for languages
  -- langs = {}, -- See the default presets in lua/treesj/langs
  -- enable = true,
}

vim.g.coq_settings = {
  auto_start = 'shut-up',
  clients = {
    tmux = { all_sessions = false },
  },
  display = {
    icons = { mode = 'none' },
    statusline = { helo = false },
  },
}
local coq = require('coq')
-- vim.lsp.enable('ansiblels', coq.lsp_ensure_capabilities())
-- -- vim.lsp.enable('awk_ls', coq.lsp_ensure_capabilities())
-- vim.lsp.enable('bashls', coq.lsp_ensure_capabilities())
vim.lsp.enable('vimls', coq.lsp_ensure_capabilities())
-- vim.lsp.enable('vimls', coq.lsp_ensure_capabilities({
--   cmd = { '/Users/reishoku/.local/npm/bin/vim-language-server', '--stdio' },
-- }))
-- vim.lsp.enable('lua_ls', coq.lsp_ensure_capabilities({
--   cmd = {'/opt/homebrew/opt/lua-language-server/bin/lua-language-server'},
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = {"vim"}
--       }
--     }
--   }
-- }))
vim.lsp.enable('lua_ls', coq.lsp_ensure_capabilities({
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
}))
-- vim.lsp.enable('cmake', coq.lsp_ensure_capabilities())
-- vim.lsp.enable('dockerls', coq.lsp_ensure_capabilities())
-- vim.lsp.enable('docker_compose_language_service', coq.lsp_ensure_capabilities())
vim.lsp.enable('clangd', coq.lsp_ensure_capabilities({
    cmd = {'/usr/bin/clangd', '--enable-config', '-j', '6', '--pch-storage', 'memory', '--background-index', '--header-insertion=never', '--experimental-modules-support'},
  })
)
-- vim.lsp.enable('ruff', coq.lsp_ensure_capabilities({
--     cmd = {'/opt/homebrew/bin/ruff', 'server'},
--   })
-- )
vim.lsp.enable('ruff', coq.lsp_ensure_capabilities({
    cmd = {'ruff', 'server'},
  })
)

require('nvim-treesitter.configs').setup({
  yati = {
    enable = true,
    disable = {
      "python",
      "c",
      "cpp",
      "python",
      "python3",
      "toml",
      "vim",
      "markdown",
      "markdown_inline",
      "rust"
    },
    default_lazy = true,
    default_fallback = "auto",
    suppress_conflict_warning = true
  },
  indent = { enable = false }, -- disable default indent
  highlight = { enable = true },
})
require('nvim-autopairs').setup()
require('trouble').setup({
  open_no_results = true,
})

vim.diagnostic.config({
  loclist = {
    open = false,
    severity = { min = vim.diagnostic.severity.HINT },
  },
})

vim.g.molokai_original = 1
vim.g.rehash256 = 1
-- vim.cmd.colorscheme('molokai')

vim.cmd('silent! colorscheme molokai')

-- vim.cmd($$)
-- vim.b.sh_indent_options = {default = 2, continuation-line = 0}

--
-- vim.g.python_indent = {}
-- vim.g.python_indent.open_paren = 4
-- vim.g.python_indent.nested_paren = 4
-- vim.g.python_indent.continue = 4
vim.g.vim_indent_cont = 2
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_no_default_key_mappings = 1
vim.g.vim_markdown_toc_autofit = 1
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_new_list_item_indent = 2
vim.g.vim_markdown_borderless_table = 1
vim.g.rust_recommended_style = 0

vim.g.lua_version = 5
vim.g.lua_subversion = 1
vim.g.markdown_recommended_style = 0

-- vim.filetype.add({
--   extension = { sub = "htcondor" },
-- })
