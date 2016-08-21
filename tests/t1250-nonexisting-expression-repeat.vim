" Test repeat of a nonexisting Vimscript function expression.

execute "normal g=2EDoesNotExist\<CR>"

execute "3normal 3w.toupper\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
