function! CRECreatHeader(HEADFILETYPE)
	exe "0r ".$CREHOME."/HEADFILE.".a:HEADFILETYPE
	let lc=system("wc -l ".$CREHOME."/HEADFILE.".a:HEADFILETYPE)
	exe "silent! 1,".lc[0]."s/<FILENAME>/".@%."/g"
endfunction

function! CREUpdateTime()
	let LastLine=line(".")
	let LastCol=col(".")
	exe "silent! %s/\*\ Last\ Edited:.*$/\*\ Last\ Edited:\ ".strftime("%c")."/g"
	exe "nohlsearch"
	call cursor(LastLine,LastCol)
endfunction

