" Test applying an external command to every pattern match.

execute "normal g=6E/\\w\\+/!sed \"s/[Dd]/&&/\"\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
