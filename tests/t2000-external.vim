" Test applying an external command.

call vimtest#SkipAndQuitIf(! executable('sed'), 'No sed available')
execute "normal g=6E!sed \"y/oD/xY/\"\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
