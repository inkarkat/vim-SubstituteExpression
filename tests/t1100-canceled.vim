" Test canceled expression.

source helpers/hookIntoError.vim
let g:teststep = 'canceled expression'

execute "normal g=6E\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
