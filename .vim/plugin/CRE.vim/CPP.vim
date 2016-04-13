function! s:CreatHeader()
	exe "0r HEADFILE.cpp"
	let lc=system("wc -l HEADFILE.cpp")
	exe "1,".lc[0]."s/<FILENAME>/".@%."/g"
endfunction

function! s:UpdateTime()
	exe "%s/\*\ Last\ Edited:.*$/\*\ Last\ Edited:\ ".strftime("%c")."/g"
	exe "nohlsearch"
	exe "normal! ``"
endfunction

augroup filetype_cpp
	autocmd!
	autocmd Filetype cpp setlocal wrap
	autocmd Filetype cpp let maplocalleader=','
	autocmd FileType cpp nnoremap <localleader>c I//<esc>
	autocmd filetype cpp :iabbrev <buffer> rt return
	autocmd filetype cpp :iabbrev <buffer> return NOPENOPENOPE
	nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
	nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
	autocmd filetype cpp setlocal foldmethod=syntax
	autocmd FileType cpp setlocal foldlevel=1
	autocmd FileType cpp :nnoremap <localleader>uc ^d/[^/]<cr>:nohlsearch<cr>
	setlocal statusline=%F%M\ -\ FileType:\ %y "File path and modified and type
	"syntastic
	setlocal statusline+=\ -\ SYN:%#warningmsg#
	setlocal statusline+=%{SyntasticStatuslineFlag()}
	setlocal statusline+=%*

	setlocal statusline+=%= "splitter
	setlocal statusline+=%c,\ %l/%L "colum, current line/ total line
	setlocal laststatus=2

	"C++ NOTE
	autocmd filetype cpp nnoremap <localleader>cn :call <SID>CreatHeader()<CR>
	autocmd filetype cpp ca <buffer> w call <SID>UpdateTime()<CR>:w
	autocmd filetype cpp ca <buffer> x call <SID>UpdateTime()<CR>:x
	autocmd BufNewFile *.cpp call <SID>CreatHeader() | exe "normal! G"
augroup END

