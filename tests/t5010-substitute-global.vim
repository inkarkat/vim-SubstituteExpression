" Test substitution with global flag.

execute "normal g:6E[Do]/(&)/g\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
