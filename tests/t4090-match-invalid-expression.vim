" Test applying an invalid Vimscript expression on all pattern matches.

source helpers/hookIntoError.vim
let g:teststep = 'invalid expression'

execute "normal g=2E/\\w\\+/'[' . v:val) * 2\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
