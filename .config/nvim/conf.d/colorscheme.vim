
let g:loaded_colorscheme_config = v:false

if g:loaded_colorscheme_config == v:true
  finish
endif

if !g:dein_plugin_manager_available
  colorscheme default
  let g:loaded_colorscheme_config = v:true
  finish
endif

colorscheme molokai

let g:loaded_colorscheme_config = v:true
