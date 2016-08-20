" Test applying a no-op expression.

source helpers/hookIntoError.vim
let g:teststep = 'no-op'
execute "normal g=6Ev:val\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
