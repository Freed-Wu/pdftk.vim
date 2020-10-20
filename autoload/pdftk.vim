let s:pdftk_temp_dir = has('unix') ? '/tmp' : $HOME .. '/AppData/Local'
let g:pdftk#dump#cmd = get(g:, 'pdftk#dump#cmd', 'dump_data_utf8')
let g:pdftk#update#cmd = get(g:, 'pdftk#update#cmd', 'update_info_utf8')
let g:pdftk#temp_dir = get(g:, 'pdftk#temp_dir', s:pdftk_temp_dir)
let g:pdftk#suffix = get(g:, 'pdftk#suffix', '.pdf')

function! pdftk#temp(file) abort "{{{
	return g:pdftk#temp_dir .. '/' .. fnamemodify(a:file, ':t:r') .. '.pdftk'
endfunction "}}}

function! pdftk#new(file) abort "{{{
	return fnamemodify(a:file, ':r') .. g:pdftk#suffix
endfunction "}}}

function! pdftk#dump(file) abort "{{{
	" perhaps command someone wanting not dump_data_utf8 but dump_data
	call system(join(['pdftk', shellescape(a:file), g:pdftk#dump#cmd, 'output', shellescape(pdftk#temp(a:file))]))
	execute 'edit' fnameescape(pdftk#temp(a:file))
	let b:file = a:file
	setfiletype pdftk
	augroup pdftk "{{{
		autocmd!
		autocmd BufWritePost <buffer> call pdftk#update(b:file)
	augroup END "}}}
endfunction "}}}

function! pdftk#update(file) abort "{{{
	if pdftk#new(a:file) ==# a:file
		let l:temp = fnamemodify(a:file, ':r') .. '-pdftk.pdf'
		echo system(join(['pdftk', shellescape(a:file), g:pdftk#update#cmd, shellescape(pdftk#temp(a:file)), 'output', shellescape(l:temp)]))
		if has('unix')
			let l:cmd = 'mv'
			let l:flag = '-f'
		else
			let l:cmd = 'move'
			let l:flag = '/f'
		endif
		call system(join([l:cmd, shellescape(l:temp), shellescape(a:file), l:flag]))
		call delete(l:temp)
	else
		echo system(join(['pdftk', shellescape(a:file), g:pdftk#update#cmd, shellescape(pdftk#temp(a:file)), 'output', shellescape(pdftk#new(a:file))]))
	endif
	call delete(pdftk#temp(a:file))
endfunction "}}}
