if exists('b:did_pdftkplugin')
	finish
endif

setlocal foldmethod=expr
setlocal foldexpr=pdftk#fold#level(v:lnum)
setlocal foldtext=pdftk#fold#text()

let b:did_pdftkplugin = 1
