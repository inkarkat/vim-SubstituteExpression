" Test applying a Vimscript function expression that filters out items to every split item.

execute "normal g=6E^\\W\\+^v:val ==# 'Diestle' ? [] : toupper(v:val)\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
