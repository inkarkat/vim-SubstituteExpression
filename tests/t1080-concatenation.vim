" Test applying a Vimscript string concatenation expression.

execute "normal g=2E'[' . v:val . '/' . v:val . ']'\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
