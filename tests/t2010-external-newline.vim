" Test applying an external command that adds a newline at the end.

call vimtest#SkipAndQuitIf(! executable('grep'), 'No grep available')
execute "normal g=6E!grep -o \"\\bD...\\b\"\<CR>"

execute "2normal g=+!grep -o \"\\bd..\\b\"\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
