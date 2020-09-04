" Test applying a Vimscript function expression to every pattern match.

execute "normal g=6E/\\w\\+/v:val . toupper(v:val)\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
