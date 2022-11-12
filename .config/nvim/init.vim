
" init.vim by reishoku

set encoding=utf-8
set mouse=a
set lazyredraw
set relativenumber
set title
set shell=fish
set autoindent
set smartindent
set expandtab
set breakindent
set copyindent
set autoread
set hidden
set showcmd
set cursorline
set wrapscan
set wrap
set autochdir
set showmatch
set undofile
set backup
set swapfile
set hlsearch
set incsearch
set softtabstop=2
set tabstop=2
set shiftwidth=2
set ttimeoutlen=10
set inccommand=split
set colorcolumn=75
set wildoptions=pum
set whichwrap=b,s,[,],<,>,~
set backspace=indent,eol,start
set laststatus=2
set matchpairs&
set matchpairs+=<:>
set completeopt=menuone

if v:progname == "view" || v:progname == "ex"
  setl readonly nonumber norelativenumber
  syntax enable
  finish
endif

if exists('g:vscode')
  finish
endif

if exists("&completeslash")
  set completeslash=slash
endif

" source dein plugin manager
if filereadable(expand("~/.config/nvim/conf.d/dein.vim"))
  source ~/.config/nvim/conf.d/dein.vim
endif

" source platform-specific configurations
if has('mac')
  source ~/.config/nvim/conf.d/macos.vim
endif

" source filetype-specific configurations
if filereadable(expand("~/.config/nvim/conf.d/filetype_config/markdown.vim"))
  source ~/.config/nvim/conf.d/filetype_config/markdown.vim
endif

" source keybindings
if filereadable(expand("~/.config/nvim/conf.d/keybindings.vim"))
  source ~/.config/nvim/conf.d/keybindings.vim
end
" source colorscheme
if filereadable(expand("~/.config/nvim/conf.d/colorscheme.vim"))
  source ~/.config/nvim/conf.d/colorscheme.vim
endif
" source autocmd
if filereadable(expand("~/.config/nvim/conf.d/autocmd.vim"))
  source ~/.config/nvim/conf.d/autocmd.vim
endif
