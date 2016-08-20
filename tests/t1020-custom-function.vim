" Test applying a custom function.

execute "normal g=6ECustomFunc\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
