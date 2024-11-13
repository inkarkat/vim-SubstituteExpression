" Test applying a Vimscript function expression that returns a List of strings.

execute "normal g=6E['<<<', v:val, v:val, '>>>']\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
