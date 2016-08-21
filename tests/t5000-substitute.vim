" Test substitution.

execute "normal g:6E[Do]/(&)/\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
