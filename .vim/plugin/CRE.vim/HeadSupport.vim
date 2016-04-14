function! CRECreatHeader(HEADFILETYPE)
	exe "0r ".$CREHOME."/HEADFILE.".a:HEADFILETYPE
	let lc=system("wc -l ".$CREHOME."/HEADFILE.".a:HEADFILETYPE)
	exe "silent! 1,".lc[0]."s/<FILENAME>/".@%."/g"
endfunction

function! CREUpdateTime()
	exe "silent! %s/\*\ Last\ Edited:.*$/\*\ Last\ Edited:\ ".strftime("%c")."/g"
	exe "nohlsearch"
	exe "normal! ``"
endfunction

