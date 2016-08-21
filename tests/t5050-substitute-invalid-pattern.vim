" Test substitution with invalid pattern.

source helpers/hookIntoError.vim
let g:teststep = 'invalid pattern'

execute "normal g:6Eo\\)/(&)/\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
