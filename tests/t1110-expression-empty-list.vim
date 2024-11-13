" Test applying a Vimscript function expression that returns an empty List.

execute "normal g=6E[]\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
