" My IDMSX Restructure Parameter FileType Plugin file
"
" Only do this if the buffer has not been initialised
"
if exists("b:did_ftplugin")
	finish
endif

let b:did_ftpulgin=1

setlocal softtabstop=2
setlocal tabstop=2
setlocal expandtab
setlocal shiftwidth=2
setlocal foldcolumn=4
setlocal foldmethod=syntax

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=tc fo+=roq

" Format comments to be up to 72 characters long
setlocal tw=72

