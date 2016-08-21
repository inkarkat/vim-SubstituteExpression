" Test applying Ex commands over multiple lines.

execute "normal g=2):%>|global/z/delete _\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
