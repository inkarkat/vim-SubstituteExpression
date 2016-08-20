" Test applying a built-in function.

execute "normal g=6Etolower\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
