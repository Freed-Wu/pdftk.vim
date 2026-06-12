let g:exiftool#write_args = get(g:, 'exiftool#write_args', ['-overwrite_original'])

function! exiftool#read() abort "{{{
	setlocal buftype=acwrite
	filetype detect

	let file = pdftk#get_filename()
	let lines = systemlist(join(['exiftool', '-' . &filetype, shellescape(file)]))
	silent put=lines
	1d
endfunction "}}}

function! exiftool#write() abort "{{{
	if !&modified
		return
	endif
	let file = pdftk#get_filename()
	let lines = getline(1, '$')
	echo system(join(['exiftool'] + g:exiftool#write_args + ['-' . &filetype . '=-', shellescape(file)]), lines)
	setlocal nomodified
endfunction "}}}
