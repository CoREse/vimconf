source $CREHOME/OnEvent.vim
source $CREHOME/Functional.vim

function! GrowBabies()
	let Adults=readfile('.babies')
	let Babies=readfile($CREHOME."/Babynames")
	let NumberToGrow=len(Adults)
	if len(Adults)>len(Babies)
		let NumberToGrow=len(Babies)
	endif
	let i=0
	while i<NumberToGrow
		exe 'silent! %s/\<'.Babies[i].'\>/'.Adults[i].'/g'
		let i+=1
	endwhile
endfunction

function! CallBabies()
	let Adults=readfile('.babies')
	let Babies=readfile($CREHOME."/Babynames")
	let NumberToCall=len(Adults)
	if len(Adults)>len(Babies)
		let NumberToCall=len(Babies)
	endif
	let i=0
	while i<NumberToCall
		exe 'silent! %s/\<'.Adults[i].'\>/'.Babies[i].'/g'
		let i+=1
	endwhile
endfunction

if !exists("b:UNIQUE_OnBabies")
	if filereadable(".babies")
		let b:OnBufReadFunctions= Append(b:OnBufReadFunctions, function("GrowBabies"))
		let b:OnWriteAndQuitFunctions= Append(b:OnWriteAndQuitFunctions,function("CallBabies"))
	endif
	let b:UNIQUE_OnBabies=1
endif

