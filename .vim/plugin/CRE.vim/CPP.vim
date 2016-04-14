source $CREHOME/HeadSupport.vim
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
	autocmd filetype cpp nnoremap <localleader>cn :call CRECreatHeader(&ft)<CR>
	autocmd filetype cpp ca <buffer> w call CREUpdateTime()<CR>:w
	autocmd filetype cpp ca <buffer> x call CREUpdateTime()<CR>:x
	autocmd BufNewFile *.cpp call CRECreatHeader(&ft) | exe "normal! G"
augroup END

