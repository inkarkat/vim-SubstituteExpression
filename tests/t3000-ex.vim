" Test applying an Ex command.

execute "normal g=6E:%>\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
