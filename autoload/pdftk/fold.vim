let g:pdftk#bookmark = get(g:, 'pdftk#bookmark', ['Part', 'Chapter', 'Section', 'Subsection', 'Subsubsection', 'Paragraph', 'SubParagraph'])
let s:foldchar = matchstr(&fillchars, '\(fold:\)\@<=.')
if empty(s:foldchar)
	let s:foldchar = '='
endif

function! pdftk#fold#level(num) abort "{{{
	if getline(a:num) =~# '^\(Info\|Bookmark\|PageMedia\)Begin$'
		return '>1'
	elseif getline(a:num) =~# '^\(NumberOfPages\)\|\(PdfID\)'
		return 0
	elseif getline(a:num + 1) =~# '^\(Info\|Bookmark\|PageMedia\)Begin$'
		return '<1'
	endif
	return '='
endfunction "}}}

function! pdftk#fold#text() abort "{{{
	let l:foldkind = getline(v:foldstart)[0:-6]
	if l:foldkind ==# 'Info'
		let l:dict = pdftk#fold#getdict(['InfoKey', 'InfoValue'])
		return l:dict['InfoKey'] . ': ' . l:dict['InfoValue']
	elseif l:foldkind ==# 'Bookmark'
		let l:dict = pdftk#fold#getdict(['BookmarkTitle', 'BookmarkLevel', 'BookmarkPageNumber'])
		let l:prefix = g:pdftk#bookmark[l:dict['BookmarkLevel']] . ' ' . l:dict['BookmarkTitle']
		return pdftk#fold#line(l:prefix, l:dict['BookmarkPageNumber'])
	elseif l:foldkind ==# 'PageMedia'
		let l:dict = pdftk#fold#getdict(['PageMediaNumber', 'PageMediaRotation', 'PageMediaRect', 'PageMediaDimensions'])
		let l:prefix = join([l:dict['PageMediaDimensions'], l:dict['PageMediaRect'], l:dict['PageMediaRotation']], '|')
		return pdftk#fold#line(l:prefix, l:dict['PageMediaNumber'])
	endif
endfunction "}}}

" for a Chinese character
" len(split(a:str, '\zs')) will return 1, len(a:str) will return 3
" (1 + 3)/2 = 2.
" for a Ascii character, (1 + 1)/2 = 1
function! pdftk#fold#textwidth(str) abort "{{{
	return winwidth(0) - &numberwidth - (len(split(a:str, '\zs')) + len(a:str))/2
endfunction "}}}

function! pdftk#fold#line(prefix, suffix) abort "{{{
	return a:prefix . repeat(s:foldchar, pdftk#fold#textwidth(a:prefix . a:suffix)) . a:suffix
endfunction "}}}

function! pdftk#fold#matchkey(start, len, key) abort "{{{
	for l:line in range(a:start, a:start + a:len - 1)
		let l:value = matchstr(getline(l:line), '\(' . a:key . ': *\)\@<=\S.*')
		if l:value !=# ''
			return l:value
		endif
	endfor
	return ''
endfunction "}}}

function! pdftk#fold#matchkeys(start, len, keys) abort "{{{
	let l:dict = {}
	for l:key in a:keys
		let l:dict[l:key] = pdftk#fold#matchkey(a:start, a:len, l:key)
	endfor
	return l:dict
endfunction "}}}

function! pdftk#fold#getdict(keys) abort "{{{
	return pdftk#fold#matchkeys(v:foldstart + 1, len(a:keys), a:keys)
endfunction "}}}
