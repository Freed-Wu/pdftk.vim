if exists('g:loaded_pdftk') || &cpoptions
  finish
endif
let g:loaded_pdftk = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

augroup pdftk
  autocmd!
  autocmd BufReadCmd,SessionLoadPost *.pdf.txt call pdftk#read()
  autocmd BufWriteCmd *.pdf.txt call pdftk#write()
  autocmd BufReadCmd,SessionLoadPost *.{pdf,jpg,jp2,png,gif,webp,xmp,mp4}.{csv,json} call exiftool#read()
  autocmd BufWriteCmd *.{pdf,jpg,jp2,png,gif,webp,xmp,mp4}.{csv,json} call exiftool#write()
augroup END

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
