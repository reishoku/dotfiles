
let dein_plugin_manager_available = v:false

" install dein.vim if not installed

if !has("win32")
	let g:user_home_cache_dir = expand("~/.cache")
endif

if !has("win32")
  if !isdirectory(g:user_home_cache_dir)
    call mkdir(g:user_home_cache_dir)
  endif
	if !executable("curl") || !executable("git")
		echohl ErrorMsg
		echomsg "executable not found: curl or git"
		echohl None
	endif
	" clone dein.vim
	if !isdirectory(g:user_home_cache_dir . "/dein/" . "repos/github.com/Shougo/dein.vim")
		echomsg "Installing dein plugin manager..."
	  silent! call system("mkdir -p " . g:user_home_cache_dir . "/dein/repos/github.com/Shougo/dein.vim")
		silent! call system("git clone --depth=1 http://github.com/Shougo/dein.vim " . g:user_home_cache_dir . "/dein/repos/github.com/Shougo/dein.vim")
	  call feedkeys("\<CR>")
	endif
	let dein_plugin_manager_available = v:true
endif
 
" dependency check
if !has("win32")
  if !executable("deno")
    echohl ErrorMsg
    echomsg "executable \"deno\" not found!"
    echohl None
  endif
  if !executable("tree-sitter")
    echohl ErrorMsg
    echomsg "executable \"tree-sitter\" not found!"
    echohl None
  endif
  if !executable("glow")
    echohl ErrorMsg
    echomsg "executable \"glow\" not found!"
    echohl None
  endif
  if !executable("latexmk")
    echohl ErrorMsg
    echomsg "executable \"latexmk\" not found!"
    echohl None
  endif
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(g:user_home_cache_dir . "/dein")
  call dein#begin(g:user_home_cache_dir . "/dein")
    call dein#add("tomasr/molokai")
    call dein#add('ConradIrwin/vim-bracketed-paste')
    call dein#add('Shougo/ddc.vim')
    call dein#add('Shougo/ddc-nvim-lsp')
    call dein#add('LumaKernel/ddc-file')
    call dein#add('Shougo/context_filetype.vim')
    call dein#add('Shougo/ddc-around')
    call dein#add('Shougo/ddc-converter_remove_overlap')
    call dein#add('Shougo/ddc-matcher_head')
    call dein#add('Shougo/ddc-matcher_length')
    call dein#add('Shougo/ddc-sorter_rank')
    call dein#add('Shougo/ddc-ui-native')
    call dein#add('Shougo/ddu-ui-ff')
    call dein#add('Shougo/ddu.vim')
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/pum.vim')
    call dein#add('dag/vim-fish')
    call dein#add('ellisonleao/glow.nvim')
    call dein#add('folke/todo-comments.nvim')
    call dein#add('gelguy/wilder.nvim')
    call dein#add('godlygeek/tabular')
    call dein#add('j-hui/fidget.nvim')
    call dein#add('jghauser/mkdir.nvim')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('lervag/vimtex')
    call dein#add('matsui54/ddc-buffer')
    call dein#add('matsui54/ddc-dictionary')
    call dein#add('matsui54/denops-popup-preview.vim')
    call dein#add('mtdl9/vim-log-highlighting')
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('nvim-lua/plenary.nvim')
    call dein#add('nvim-lualine/lualine.nvim')
    call dein#add('nvim-treesitter/nvim-treesitter')
    call dein#add('nvim-treesitter/nvim-treesitter-context')
    call dein#add('preservim/vim-markdown')
    call dein#add('tani/ddc-fuzzy')
    call dein#add('vim-denops/denops.vim')
    call dein#add('vim-jp/vimdoc-ja')
    call dein#add('williamboman/mason.nvim')
    call dein#add('williamboman/mason-lspconfig.nvim')
    call dein#add('yioneko/nvim-yati')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
    call dein#add('kyazdani42/nvim-web-devicons')
    call dein#add('preservim/nerdtree')
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

" source plugin-specific configurations
let g:denops_disable_version_check=1
source ~/.config/nvim/conf.d/plugin_config/vimtex.vim
source ~/.config/nvim/conf.d/plugin_config/lua.vim
source ~/.config/nvim/conf.d/plugin_config/nvim-lsp.vim
source ~/.config/nvim/conf.d/plugin_config/wilder.nvim
source ~/.config/nvim/conf.d/plugin_config/ddc.vim
source ~/.config/nvim/conf.d/plugin_config/vim-markdown.vim


" source autocmd
autocmd FileType vim call ddc#custom#patch_filetype(['vim'], 'sources', ['nvim-lsp', 'file', 'necovim', 'around'])
autocmd FileType c,cpp call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['nvim-lsp', 'file', 'around'])
autocmd FileType tex,latex call ddc#custom#patch_filetype(['tex', 'latex'], 'sources', ['nvim-lsp', 'file', 'around']) | set syntax=tex
autocmd FileType tex,latex setlocal indentexpr=GetTeXIndent() | let g:tex_indent_items = 0
autocmd BufNewFile,BufRead *.yaml lua require'lspconfig'.yamlls.setup{}
autocmd BufNewFile,BufRead *.yaml call ddc#custom#patch_filetype(['yaml'], 'sources', ['nvim-lsp', 'around']) | set filetype=yaml
autocmd FileType markdown call ddc#custom#patch_filetype(['markdown'], 'sources', ['nvim-lsp', 'around'])
autocmd FileType rust lua require'lspconfig'.rust_analyzer.setup{}
autocmd FileType rust call ddc#custom#patch_filetype(['rust'], 'sources', ['nvim-lsp', 'around'])

