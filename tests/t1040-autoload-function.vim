" Test applying an autoload function.

set runtimepath+=.
execute "normal g=6Emodule#Func\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
