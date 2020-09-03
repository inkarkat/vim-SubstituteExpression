" Test applying a Vimscript function expression to every individual incomplete line.

execute "2normal 3Wg=).'[' . v:val . ']'\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
