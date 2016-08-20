" Test applying a Vimscript function expression.

execute "normal g=6Etoupper(v:val)\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
