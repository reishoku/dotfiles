autocmd FileType vim call ddc#custom#patch_filetype(['vim'], 'sources', ['nvim-lsp', 'file', 'necovim', 'around'])
autocmd FileType c,cpp call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['nvim-lsp', 'file', 'around'])
autocmd FileType tex,latex call ddc#custom#patch_filetype(['tex', 'latex'], 'sources', ['nvim-lsp', 'file', 'around']) | set syntax=tex
autocmd FileType tex,latex setlocal indentexpr=GetTeXIndent() | let g:tex_indent_items = 0
autocmd BufNewFile,BufRead *.yaml lua require'lspconfig'.yamlls.setup{}
autocmd BufNewFile,BufRead *.yaml call ddc#custom#patch_filetype(['yaml'], 'sources', ['nvim-lsp', 'around']) | set filetype=yaml
autocmd FileType markdown call ddc#custom#patch_filetype(['markdown'], 'sources', ['nvim-lsp', 'around'])
autocmd FileType rust lua require'lspconfig'.rust_analyzer.setup{}
autocmd FileType rust call ddc#custom#patch_filetype(['rust'], 'sources', ['nvim-lsp', 'around'])
autocmd FileType help wincmd L
" autocmd TermOpen term://* setl modifiable norelativenumber scrollback=1000000 | startinsert
