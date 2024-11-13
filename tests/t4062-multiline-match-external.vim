" Test applying an external command to every pattern match of a multiline text.

call vimtest#SkipAndQuitIf(! executable('sed'), 'No sed available')

execute "normal g=}/\\w\\+/!sed -e \"s/[Dd]/&&/\" -e \"/^fox/p\"\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
