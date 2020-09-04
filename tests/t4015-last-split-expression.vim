" Test applying a Vimscript function expression to every last search split item.

let @/ = '\W\+'
execute "normal g=6E^^v:val . toupper(v:val)\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
