" Test applying a Vimscript function expression to a part of a single line.

execute "2normal 3Wg=2E.'[' . v:val . ']'\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
