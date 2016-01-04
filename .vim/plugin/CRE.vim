"Learn Vim The Hardway {{{
nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction

nnoremap <leader>q :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open=0

function! s:QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open=0
		execute g:quickfix_return_to_window . "wincmd w"
	else
		let g:quickfix_return_to_window=winnr()
		copen
		let g:quickfix_is_open =1
	endif
endfunction

" }}}

" Mappings {{{
" I Mappings {{{
inoremap <leader>" ""<esc>i
inoremap <leader>' ''<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i<enter><esc>O
inoremap <leader>( ()<esc>i
inoremap <leader>] []
inoremap <leader>} {}
inoremap <leader>) ()
" }}}

" N Mappings {{{

nnoremap <leader>N :NERDTreeToggle<cr>

" }}}

" }}}

" Abbreviations {{{
" }}}

" FileType-specific settings {{{

nnoremap ,b :echom "ccc"<cr>

augroup FileType_VIM
	autocmd!
	autocmd FileType vim :cnoremap x<cr> w<cr>:source %<cr>:q<cr>
augroup END
" }}}

" Functions {{{
" }}}
