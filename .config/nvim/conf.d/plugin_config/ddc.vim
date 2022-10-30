
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


inoremap <silent><expr> <TAB>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()

inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

call ddc#enable()
call popup_preview#enable()

