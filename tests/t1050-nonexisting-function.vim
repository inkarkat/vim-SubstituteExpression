" Test applying a nonexisting function.

source helpers/hookIntoError.vim
let g:teststep = 'nonexisting function'

execute "normal g=6EDoesNotExist\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
