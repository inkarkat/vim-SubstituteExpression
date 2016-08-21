" Test repeat of substitution.

execute "normal g:6E[Do]/(&)/\<CR>"

3normal 3w.
2normal w4.

call vimtest#SaveOut()
call vimtest#Quit()
