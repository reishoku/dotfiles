
let g:loaded_macos_specific_configs = v:false

if g:loaded_macos_specific_configs == v:true
  finish
endif

" macOS-specific configurations

let g:python_host_skip_check=1
let g:loaded_python_provider=0
let g:python3_host_skip_check=1

" arm64-specific configurations
let g:python3_host_prog="/opt/homebrew/bin/python3"
let g:ruby_host_prog="/opt/homebrew/opt/ruby/bin/gem"

" finish loading macOS-specific configurations
let g:loaded_macos_specific_configs = v:true

" swap, undo, backup directories
if has("mac")
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
