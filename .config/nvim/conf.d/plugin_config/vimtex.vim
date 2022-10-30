let g:vimtex_syntax_enabled = 0
let g:tex_indent_items = 0
let g:tex_conceal = ""
let g:tex_indent_and = 0
let g:tex_indent_brace = 1
let g:tex_flavor = "latex"
let g:vimtex_compiler_latexmk_engines = {'_': '-pdfdvi -pvc'}
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 0
let b:Imap_FreezeImap = 1
let g:vimtex_compiler_latexmk = {
  \ 'backend' : 'jobs',
  \ 'background': 1,
  \ 'build_dir' : '',
  \ 'callback' : 1,
  \ 'continuous': 1,
  \ 'executable': 'latexmk',
  \ 'options': [
    \         '-file-line-error',
    \         '-synctex=1',
    \         '-interaction=nonstopmode',
    \ ],
\}
let g:vimtex_quickfix_ignore_filters = [
\ 'Unused global option(s)',
\ 'The anchor of',
\ 'Underfull \hbox',
\ 'Overfull \hbox'
\]
