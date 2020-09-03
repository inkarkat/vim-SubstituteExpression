" Test applying a Vimscript function expression to match and splits where the separator is contained and escaped.

execute "normal $F<g=$/\\/\\w/v:val . v:val\<CR>"
execute "4normal 0g=$^\\^\\w\\+\\|\\w\\+$^toupper(v:val)\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
