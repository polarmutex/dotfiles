
" Delete all trailing spaces
	function! RemoveTrailingSpaces()
		let l:win_view = winsaveview()
		let l:save_slash = getreg('/')
		execute 'keepjumps%s:\s\+$::ge'
		call histdel("/", -1)
		call winrestview(l:win_view)
		call setreg('/', l:save_slash)
	endfunction

