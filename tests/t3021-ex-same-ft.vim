" Test applying Ex commands with the original buffer filetype.

let &runtimepath = expand('<sfile>:p:h') . ',' . &runtimepath
filetype plugin on
setf testft

execute "normal g=2):TestftCommand\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
