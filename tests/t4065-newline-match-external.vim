" Test applying an external command to matches ending with a newline of a linewise selection.
" Tests that the newline is kept, but other matches do not get one added.

call vimtest#SkipAndQuitIf(! executable('tr'), 'No tr available')

execute "normal V3jg=/\\S.\\{-}[:,\\n]/!tr a-z A-Z\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
