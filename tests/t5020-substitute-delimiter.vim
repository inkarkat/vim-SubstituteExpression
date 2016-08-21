" Test substitution with a different delimiter.

execute "normal g:$\<BS>#/#!!!#\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
