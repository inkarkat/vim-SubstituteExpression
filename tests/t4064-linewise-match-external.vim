" Test applying an external command to every pattern match of a linewise selection.
" Tests that matches do not get a newline added, even though the selection
" itself is linewise.

call vimtest#SkipAndQuitIf(! executable('grep'), 'No grep available')

execute "normal V2jg=/\\w\\+/!grep -v fox || true\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
