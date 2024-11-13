" Test applying a Vimscript function expression that adds additional item to every split item.

execute "normal g=6E^\\W\\+^v:val ==# 'Diestle' ? ['<<<', v:val, v:val, '>>>'] : toupper(v:val)\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
