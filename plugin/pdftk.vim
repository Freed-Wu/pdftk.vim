if exists('g:loaded_pdftk') || &cpoptions
  finish
endif
let g:loaded_pdftk = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

augroup pdftk
  autocmd!
  autocmd BufReadCmd,SessionLoadPost pdftk://* call pdftk#read()
  autocmd BufWriteCmd pdftk://* call pdftk#write()
augroup END

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
