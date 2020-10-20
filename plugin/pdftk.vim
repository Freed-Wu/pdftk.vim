if exists('g:loaded_pdftk') || &cpoptions
  finish
endif
let g:loaded_pdftk = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

command! -nargs=1 -complete=file PdftkDump call pdftk#dump(<q-args>)

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
