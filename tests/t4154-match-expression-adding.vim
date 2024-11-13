" Test applying a Vimscript function expression that adds additional items to every pattern match.

execute "normal g=6E/\\w\\+/v:val ==# 'Diestle' ? ['<<<', v:val, v:val, '>>>'] : toupper(v:val)\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
