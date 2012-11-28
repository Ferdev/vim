function! DWMNew_CtrlP()
  if bufname('%') != ''
    call DWM_New()
  endif
  exec 'CtrlP'
endfunction

let g:dwm_map_keys = 'no'

nnoremap <silent> <Plug>DWMNewCtrlP :call DWMNew_CtrlP()<CR>

nmap <C-N> <Plug>DWMNewCtrlP
nmap <C-C> <Plug>DWMClose
nmap <C-L> <Plug>DWMFocus
nmap <C-p> <Plug>DWMNewCtrlP
