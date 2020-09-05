" Test applying a Vimscript function expression that adds additional lines to every individual line.

execute "2normal g=G.v:val =~# 'lazy' ? ['<<<', v:val, v:val, '>>>'] : '[' . v:val . ']'\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
