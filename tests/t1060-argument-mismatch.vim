" Test applying a function with mismatching arguments.

function! BadFunc( stuff, more, text )
    return ''
endfunction
source helpers/hookIntoError.vim
let g:teststep = 'mismatching arguments function'

execute "normal g=6EBadFunc\<CR>"

call vimtest#SaveOut()
call vimtest#Quit()
