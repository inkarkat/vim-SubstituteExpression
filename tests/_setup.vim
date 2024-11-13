call vimtest#AddDependency('vim-ingo-library')
call vimtest#AddDependency('vim-TextTransform')
call vimtest#AddDependency('vim-SidTools')  " for testing

runtime plugin/SubstituteExpression.vim

function! CustomFunc( text )
    return tr(a:text, 'oD', 'xY')
endfunction

edit test.txt
1normal! 2fD
