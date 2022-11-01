
call ddc#custom#patch_global('sources', ['nvim-lsp', 'file', 'around', 'buffer', 'dictionary'])
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'matchers': ['matcher_head'], 'mark': 'matcher_head'},
      \ 'necovim': {'mark': 'necovim'},
      \ 'file': {'forceCompletionPattern': '\S/\S*', 'mark': 'file'},
      \ '_': {
        \ 'matchers': ['matcher_fuzzy'],
        \ 'sorters': ['sorter_fuzzy'],
        \ 'converters': ['converter_fuzzy'],
        \ 'necovim': {'mark': 'necovim'},
        \ 'buffer': {'mark': 'buffer'},
        \ 'minAutoCompleteLength': 1,
        \ 'nvim-lsp': {
        \  'mark': 'nvim-lsp',
        \  'forceCompletionPattern': '\.\w*|:\w*|->\w*'
        \ }
        \}
        \})
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ 'file': {'mode': 'os', 'trailingSlash': v:true, 'cwdAsRoot': v:true, 'projAsRoot': v:false},
      \ 'dictionary': {'dictPaths': ['/usr/share/dict/words'], 'smartCase': v:true},
      \ 'buffer': {'requireSameFiletype': v:false, 'fromAltBuf': v:true, 'forceCollect': v:false, 'limitBytes': 5000000}
      \})
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('ui', 'native')

" inoremap <silent><expr> <TAB>
"       \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
"       \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
"       \ '<TAB>' : ddc#map#manual_complete()

inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

" source autocmds
autocmd FileType vim call ddc#custom#patch_filetype(['vim'], 'sources', ['nvim-lsp', 'file', 'necovim', 'around'])
autocmd FileType c,cpp call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['nvim-lsp', 'file', 'around'])
autocmd FileType tex,latex call ddc#custom#patch_filetype(['tex', 'latex'], 'sources', ['nvim-lsp', 'file', 'around']) | set syntax=tex
autocmd FileType tex,latex setlocal indentexpr=GetTeXIndent() | let g:tex_indent_items = 0
autocmd BufNewFile,BufRead *.yaml lua require'lspconfig'.yamlls.setup{}
autocmd BufNewFile,BufRead *.yaml call ddc#custom#patch_filetype(['yaml'], 'sources', ['nvim-lsp', 'around']) | set filetype=yaml
autocmd FileType markdown call ddc#custom#patch_filetype(['markdown'], 'sources', ['nvim-lsp', 'around'])
autocmd FileType rust lua require'lspconfig'.rust_analyzer.setup{}
autocmd FileType rust call ddc#custom#patch_filetype(['rust'], 'sources', ['nvim-lsp', 'around'])


call ddc#enable()
call popup_preview#enable()

