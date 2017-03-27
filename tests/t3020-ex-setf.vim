" Test applying Ex commands with a custom filetype.

let &runtimepath = expand('<sfile>:p:h') . ',' . &runtimepath
filetype plugin on

execute "normal g=2):setf testft\<Bar>TestftCommand\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
