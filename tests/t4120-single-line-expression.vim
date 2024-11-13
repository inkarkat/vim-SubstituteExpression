" Test applying a Vimscript function expression to a single line.

execute "2normal g=$.'[' . v:val . ']'\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
