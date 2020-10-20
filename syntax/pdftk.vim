if exists('b:current_syntax')
	finish
endif
let s:save_cpoptions = &cpoptions
set cpoptions&vim

syn keyword	pdftkBegin	InfoBegin BookmarkBegin PageMediaBegin
syn keyword	pdftkInfo	InfoKey InfoValue
syn keyword	pdftkInfoKey	Keywords Creator ModDate CreationDate Producer Subject Author Title Language Company SourceModified
syn keyword	pdftkBookmark	BookmarkTitle BookmarkLevel BookmarkPageNumber
syn keyword	pdftkPageMedia	PageMediaNumber PageMediaRotation PageMediaRect PageMediaDimensions
syn keyword	pdftkType	NumberOfPages
syn match	pdftkId		display '\<PdfID\d\+\>'
syn case ignore
syn match 	pdftkNumber	display '\<\d\+\>'
syn match 	pdftkNumber	display '\<\d\+\.\d\+\>'
syn match 	pdftkNumber	display '\<\x\+\>'
syn case match

hi def link pdftkBegin		Function
hi def link pdftkInfo		pdftkType
hi def link pdftkBookmark	pdftkType
hi def link pdftkPageMedia	pdftkType
hi def link pdftkId		pdftkType
hi def link pdftkType		Type
hi def link pdftkInfoKey	Statement
hi def link pdftkNumber		Number

let b:current_syntax = 'pdftk'
let &cpo = s:save_cpoptions
unlet s:save_cpoptions
