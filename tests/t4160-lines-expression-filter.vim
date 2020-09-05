" Test applying a Vimscript function expression that filters out lines to every individual line.

execute "2normal g=G.v:val =~# 'lazy' ? [] : '[' . v:val . ']'\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
