" Test applying a nonexisting external command.

source helpers/hookIntoError.vim
let g:teststep = 'nonexisting external command'

execute "normal g=6E!doesnotexist 'foo' 'bar'\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
