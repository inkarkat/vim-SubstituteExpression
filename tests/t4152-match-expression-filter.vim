" Test applying a Vimscript function expression that filters out items to every pattern match.

execute "normal g=6E/\\w\\+/v:val ==# 'Diestle' ? [] : toupper(v:val)\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
