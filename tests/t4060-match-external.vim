" Test applying an external command to every pattern match.

call vimtest#SkipAndQuitIf(! executable('sed'), 'No sed available')

execute "normal g=6E/\\w\\+/!sed \"s/[Dd]/&&/\"\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
