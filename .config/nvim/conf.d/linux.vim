
let g:loaded_linux_specific_configs = v:false

if g:loaded_linux_specific_configs == v:true
  finish
endif

" Linux-specific configurations

let g:python_host_skip_check=1
let g:loaded_python_provider=0
let g:python3_host_skip_check=1

if !empty(executable("python3"))
  let g:python3_host_prog = exepath("python3")
endif
if !empty(executable("neovim-ruby-host"))
  let g:ruby_host_prog = exepath("neovim-ruby-host")
endif

" finish loading Linux-specific configurations
let g:loaded_linux_specific_configs = v:true

" swap, undo, backup directories
if has("linux")
  if !isdirectory(expand("~/.cache"))
    call mkdir(expand("~/.cache"))
  endif
  if !isdirectory(expand("~/.cache/nvim"))
    call mkdir(expand("~/.cache/nvim"))
  endif
  if !isdirectory(expand("~/.cache/nvim/swap"))
    call mkdir(expand("~/.cache/nvim/swap"))
  endif
  if !isdirectory(expand("~/.cache/nvim/backup"))
    call mkdir(expand("~/.cache/nvim/backup"))
  endif
  if !isdirectory(expand("~/.cache/nvim/undo"))
    call mkdir(expand("~/.cache/nvim/undo"))
  endif
  set directory=~/.cache/nvim/swap
  set backupdir=~/.cache/nvim/backup
  set undodir=~/.cache/nvim/undo
endif
