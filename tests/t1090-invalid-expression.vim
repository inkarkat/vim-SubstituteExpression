" Test applying an invalid Vimscript expression.

source helpers/hookIntoError.vim
let g:teststep = 'invalid expression'

execute "normal g=2E'[' . v:val) * 2\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
