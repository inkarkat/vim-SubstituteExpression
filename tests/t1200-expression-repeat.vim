" Test repeat of a Vimscript function expression.

execute "normal g=2Etoupper(v:val)\<CR>"

3normal 3w.
2normal w4.

call vimtest#SaveOut()
call vimtest#Quit()
