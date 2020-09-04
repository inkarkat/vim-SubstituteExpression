" Test applying an external command to matches with a newline inside of a linewise selection.
" Tests that the newline is kept, but none at the end is added.

call vimtest#SkipAndQuitIf(! executable('tr'), 'No tr available')

execute "normal V5jg=/\\S\\+\\n\\+\\S\\+/!tr a-z A-Z\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
