" Test applying a Vimscript function expression to every individual line.

execute "2normal g=G.'[' . v:val . ']'\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
