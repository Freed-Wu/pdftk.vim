"" perhaps command someone wanting not dump_data_utf8 but dump_data
let g:pdftk#dump_cmd = get(g:, 'pdftk#dump#cmd', 'dump_data_utf8')
let g:pdftk#update_cmd = get(g:, 'pdftk#update#cmd', 'update_info_utf8')

function! pdftk#get_filename() abort "{{{
	return expand(substitute(expand('%'), '^pdftk://', '', ''))
endfunction "}}}

function! pdftk#read() abort "{{{
	setlocal buftype=acwrite
	setfiletype pdftk

	let file = pdftk#get_filename()
	let lines = systemlist(join(['pdftk', shellescape(file), g:pdftk#dump_cmd, 'output', '-']))
	silent put=lines
	1d
endfunction "}}}

function! pdftk#write() abort "{{{
	if !&modified
		return
	endif
	let file = pdftk#get_filename()
	let lines = getline(1, '$')
	let list = systemlist(join(['pdftk', shellescape(file), g:pdftk#update_cmd, '-', 'output', '-']), lines)
	call writefile(list, file)
	setlocal nomodified
endfunction "}}}
