" Abbreviation for inserting filename
iab fn <C-r>=expand('%:r')<CR>

set makeprg=javac\ -g\ %\ \|\ :cwindow
setlocal omnifunc=syntaxcomplete#Complete
