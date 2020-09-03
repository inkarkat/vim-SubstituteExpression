" SubstituteExpression.vim: Pass text through an expression.
"
" DEPENDENCIES:
"   - ingo-library.vim plugin
"
" Copyright: (C) 2016-2020 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
let s:save_cpo = &cpo
set cpo&vim

function! SubstituteExpression#Expression( text )
    if ! g:TextTransformContext.isRepeat || empty(s:expression)
	let l:expression = input('=', '')
	if empty(l:expression)
	    throw 'Canceled'
	endif
    else
	let l:expression = s:expression
    endif

    try
	let l:result = s:ProcessExpression(a:text, g:TextTransformContext.mode, l:expression)
	let s:expression = l:expression " Only assign here so that if the expression causes an exception, it will not be persisted.
	return l:result
    catch /^Vim\%((\a\+)\)\=:/
	let s:expression = ''   " Empty the persisted expression so that the user will be re-queried on repeat.
	throw ingo#msg#MsgFromVimException()   " Avoid E608: Cannot :throw exceptions with 'Vim' prefix
    endtry
endfunction
function! s:ProcessExpression( text, textMode, expression ) abort
    let l:expression = a:expression
    let l:isSystem = 0
    if l:expression =~? '^\%(g:\)\?[a-z][a-z0-9#_]\+$'
	let l:expression .= '(v:val)'
    elseif l:expression =~# '^!'
	let l:expression = printf('%s(%s, v:val)', (a:textMode ==# 'V' ? 'system' : 'ingo#system#Chomped'), string(l:expression[1:]))
	let l:isSystem = 1
    elseif l:expression =~# '^:'
	let l:originalFiletypeCommand = (empty(&l:filetype) || l:expression =~# '^:setf\s' ?
	\   '' :
	\   printf("execute 'silent! setf %s'|", &l:filetype)
	\)
	return ingo#buffer#temp#ExecuteWithText(a:text, l:originalFiletypeCommand . l:expression[1:])
    endif

    let l:result = ingo#actions#EvaluateWithVal(l:expression, a:text)

    if (l:isSystem || l:expression =~# '^system(') && v:shell_error != 0
	throw ingo#msg#MsgFromShellError('execute', l:result)
    endif

    return l:result
endfunction
function! SubstituteExpression#Substitute( text )
    if ! g:TextTransformContext.isRepeat || empty(s:substitution)
	let l:substitution = input(':s', '/')
	if empty(l:substitution) || l:substitution ==# '/'
	    throw 'Canceled'
	endif
    else
	let l:substitution = s:substitution
    endif

    let [l:separator, l:pattern, l:replacement, l:flags] = ingo#cmdargs#substitute#Parse(l:substitution, {
    \   'flagsExpr': '\([g]\?\)', 'emptyReplacement': '', 'emptyFlags': '', 'isAllowLoneFlags': 0
    \})
    let l:pattern = ingo#cmdargs#pattern#Unescape([l:separator, l:pattern])
    let l:replacement = ingo#cmdargs#pattern#Unescape([l:separator, l:replacement])
    try
	let l:result = substitute(a:text, l:pattern, l:replacement, l:flags)
	let s:substitution = l:substitution " Only assign here so that if the substitution causes an exception, it will not be persisted.
	return l:result
    catch /^Vim\%((\a\+)\)\=:/
	let s:substitution = ''   " Empty the persisted substitution so that the user will be re-queried on repeat.
	throw ingo#msg#MsgFromVimException()   " Avoid E608: Cannot :throw exceptions with 'Vim' prefix
    endtry
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
