" Test applying a custom global function.

execute "normal g=6Eg:CustomFunc\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
