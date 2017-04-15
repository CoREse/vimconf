if !exists("b:OnWriteFunctions")
	let b:OnWriteFunctions=[]
endif
if !exists("b:OnWriteAndQuitFunctions")
	let b:OnWriteAndQuitFunctions=[]
endif 
if !exists("b:OnBufReadFunctions")
	let b:OnBufReadFunctions=[]
endif 

function! s:OnWrite()
	if !exists("b:OnWriteFunctions")
		let b:OnWriteFunctions=[]
	endif

	for F in b:OnWriteFunctions
		call F()
	endfor
endfunction

function! s:OnWriteAndQuit()
	if !exists("b:OnWriteAndQuitFunctions")
		let b:OnWriteAndQuitFunctions=[]
	endif 

	for F in b:OnWriteAndQuitFunctions
		call F()
	endfor
endfunction

function! s:OnBufRead()
	if !exists("b:OnBufReadFunctions")
		let b:OnBufReadFunctions=[]
	endif 

	for F in b:OnBufReadFunctions
		call F()
	endfor
endfunction

ca <buffer> w call <SID>OnWrite()<CR>:w
ca <buffer> x call <SID>OnWriteAndQuit()<CR>:x
ca <buffer> wq call <SID>OnWriteAndQuit()<CR>:wq

augroup OnEvent
	autocmd!
	autocmd BufRead * call <SID>OnBufRead()
augroup END
