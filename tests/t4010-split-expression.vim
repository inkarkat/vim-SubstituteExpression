" Test applying a Vimscript function expression to every split item.

execute "normal g=6E^\\W\\+^v:val . toupper(v:val)\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
