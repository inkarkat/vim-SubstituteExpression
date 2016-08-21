" Test canceled substitution.

source helpers/hookIntoError.vim
let g:teststep = 'canceled substitution'

execute "normal g:6E\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
