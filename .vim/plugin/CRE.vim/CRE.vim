"""" This is the main Setting File of CRE

" Status Line {{{
set statusline=%F%M\ -\ FileType:\ %y "File path and modified and type

set statusline+=%= "splitter
set statusline+=%c,\ %l/%L "colum, current line/ total line
set laststatus=2
" }}}

" Mappings {{{
" I Mappings {{{

inoremap <c-u> <esc>lvwUi
inoremap <> <><esc>i
"the final killing machine!
inoremap jk <esc>
"and another one
inoremap <esc> <nop>
inoremap <Right> <nop> 
inoremap <Left> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

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
noremap <leader>- ddp
noremap <leader>_ ddkP
noremap <c-u> vwU<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ec :vsplit $HOME/.vim/plugin/CRE.vim<cr>
nnoremap <leader>sc :source $HOME/.vim/plugin/CRE.vim<cr>
nnoremap <leader>st :w<cr>:source %<cr>
nnoremap <leader>' i'<esc>ea'<esc>b
nnoremap <leader>" i"<esc>ea"<esc>b
"noremap H 0
noremap H 10h
"noremap L $
noremap L 10l
nnoremap <leader>l :execute 'rightbelow vsplit'. bufname("#")<cr>
nnoremap <leader>w :match Error /\v\s+$/<cr>
nnoremap <leader>W :execute 'normal! /\v\s+$/'."\r:nohlsearch\rdvgn"<cr>
nnoremap / /\v
nnoremap <leader>nh :nohlsearch<cr>
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen 12<cr>
nnoremap <leader>z za

nnoremap <leader>N :NERDTreeToggle<cr>

nnoremap <leader>f :call <SID>FoldColumnToggle()<cr>

nnoremap <leader>q :call <SID>QuickfixToggle()<cr>

"control
nnoremap J 10j
nnoremap K 10k

" for YCM
nnoremap <leader>jd :YcmCompleter GoTo<cr>

" }}}

" V Mappings {{{

vnoremap <leader>" di""<esc>P 

" }}}

" O Mappings {{{

onoremap in@ :<c-u>execute "normal! /\\w\\+@[a-zA-Z_.]\\+\r:nohlsearch\rgn"<cr><cr>

" }}}

" C Mappings {{{
" }}}

" }}}

" Abbreviations {{{
iabbrev dthtml <!DOCTYPE HTML>
iabbrev @@ zzdzhangzzd@gmail.com
iabbrev ssig --<cr>Coldice Ray Esedra<cr>zzdzhangzzd@gmail.com
iabbrev mysite crez.sinaapp.com

cabbrev w!! w !sudo tee > /dev/null %
" }}}

" Functions {{{

function! s:FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction


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

" FileType-Specific Settings {{{
" CPP specific settings are in CPP.vim in this directory
augroup filetype_html
	autocmd!
	autocmd filetype html nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup markdown
	autocmd!
	autocmd filetype markdown :onoremap ih :<c-u>execute "normal! ?^\\([=-]\\)\\1\\+$\r:nohlsearch\rkvg_"<cr><cr>
	autocmd filetype markdown :onoremap ah :<c-u>execute "normal! ?^\\([=-]\\)\\1\\+$\r:nohlsearch\rg_vk0"<cr><cr>
augroup END

augroup filetype_tex
	autocmd!
	autocmd FileType tex let maplocalleader=','
	autocmd filetype tex inoremap <buffer> <localleader>nn $$<esc>i
	autocmd FileType tex inoremap <buffer> <localleader>{ {}<esc>i
	autocmd FileType tex inoremap <buffer> <localleader>ls _{}<esc>i
	autocmd FileType tex inoremap <buffer> <localleader>us ^{}<esc>i
augroup END
"Vimscript file settings ------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim let maplocalleader=',' 
	autocmd FileType vim :iabbrev == ==#
	autocmd FileType vim :nnoremap <localleader>c I"<esc>
	autocmd FileType vim :nnoremap <localleader>uc ^d/[^"]<cr>:nohlsearch<cr>
	autocmd FileType vim :ca <buffer> x w<cr>:source %<cr>:q
augroup END
" }}}
"}}}

"Start Up {{{

" }}}
