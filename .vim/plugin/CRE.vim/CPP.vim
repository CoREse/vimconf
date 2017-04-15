source $CREHOME/HeadSupport.vim
source $CREHOME/Functional.vim
source $CREHOME/OnEvent.vim
augroup filetype_cpp
	autocmd!
	autocmd FileType cpp source $CREHOME/CPP.vim
	autocmd Filetype cpp setlocal wrap
	autocmd Filetype cpp let maplocalleader=','
	autocmd FileType cpp nnoremap <localleader>c I//<esc>
	autocmd filetype cpp :iabbrev <buffer> rt return
	"autocmd filetype cpp :iabbrev <buffer> return NOPENOPENOPE
	nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
	nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
	autocmd filetype cpp setlocal foldmethod=syntax
	autocmd FileType cpp setlocal foldlevel=2
	autocmd FileType cpp :nnoremap <localleader>uc ^d/[^/]<cr>:nohlsearch<cr>
	setlocal statusline=%F%M\ -\ FileType:\ %y "File path and modified and type
	"syntastic
	setlocal statusline+=\ -\ SYN:%#warningmsg#
	"setlocal statusline+=%{SyntasticStatuslineFlag()}
	setlocal statusline+=%*

	setlocal statusline+=%= "splitter
	setlocal statusline+=%c,\ %l/%L "colum, current line/ total line
	setlocal laststatus=2

	"C++ NOTE
	autocmd filetype cpp nnoremap <buffer> <localleader>cn :call CRECreatHeader(&ft)<CR>
	if !exists("b:UNIQUE_CPPOnWrite")
		"autocmd filetype cpp let b:OnWriteFunctions= Append(b:OnWriteFunctions,function("CREUpdateTime"))
		let b:OnWriteFunctions= Append(b:OnWriteFunctions,function("CREUpdateTime"))
		let b:UNIQUE_CPPOnWrite=1
	endif
	if !exists("b:UNIQUE_CPPOnWriteAndQuit")
		"autocmd filetype cpp let b:OnWriteAndQuitFunctions= Append(b:OnWriteAndQuitFunctions,function("CREUpdateTime"))
		let b:OnWriteAndQuitFunctions= Append(b:OnWriteAndQuitFunctions,function("CREUpdateTime"))
		let b:UNIQUE_CPPOnWriteAndQuit=1
	endif
	autocmd BufNewFile *.cpp call CRECreatHeader(&ft) | exe "normal! G"
augroup END

