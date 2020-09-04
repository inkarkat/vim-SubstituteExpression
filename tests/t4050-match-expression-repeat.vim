" Test repeat of a Vimscript function expression to every pattern match.

execute "normal g=2E/\\w\\+/v:val . toupper(v:val)\<CR>"

3normal 3w.
2normal w4.

call vimtest#SaveOut()
call vimtest#Quit()
