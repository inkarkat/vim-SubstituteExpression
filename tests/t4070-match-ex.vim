" Test applying an Ex command to every pattern match.

execute "normal g=6E/\\w\\+/:%substitute/[Dd]/&&/e | %global/the/d\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
