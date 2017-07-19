" SubstituteExpression.vim: Pass text through an expression.
"
" DEPENDENCIES:
"   - ingo/actions.vim autoload script
"   - ingo/buffer/temp.vim autoload script
"   - ingo/cmdargs/pattern.vim autoload script
"   - ingo/cmdargs/substitute.vim autoload script
"   - ingo/msg.vim autoload script
"
" Copyright: (C) 2016-2017 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.003	28-Mar-2017	Copy the current 'filetype' to the scratch
"				buffer used for :Ex_command (unless the command
"				sets a different filetype, anyway).
"   1.00.002	22-Aug-2016	Handle failure of external command by checking
"				v:shell_error.
"				Also cancel substitution when the default
"				delimiter "/' is returned, not just when
"				substitution is empty.
"	001	20-Aug-2016	file creation
let s:save_cpo = &cpo
set cpo&vim

function! s:ApplyExCommand( command, text )
endfunction
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
	if l:expression =~? '^\%(g:\)\?[a-z][a-z0-9#_]\+$'
	    let l:expression .= '(v:val)'
	elseif l:expression =~# '^!'
	    let l:expression = printf('system(%s, v:val)', string(l:expression[1:]))
	elseif l:expression =~# '^:'
	    let l:originalFiletypeCommand = (empty(&l:filetype) || l:expression =~# '^:setf\s' ?
	    \   '' :
	    \   printf("execute 'silent! setf %s'|", &l:filetype)
	    \)
	    return ingo#buffer#temp#ExecuteWithText(a:text, l:originalFiletypeCommand . l:expression[1:])
	endif

	let l:result = ingo#actions#EvaluateWithVal(l:expression, a:text)

	if l:expression =~# '^system(' && v:shell_error != 0
	    throw ingo#msg#MsgFromShellError('execute', l:result)
	endif

	let s:expression = l:expression " Only assign here so that if the expression causes an exception, it will not be persisted.
	return l:result
    catch /^Vim\%((\a\+)\)\=:/
	let s:expression = ''   " Empty the persisted expression so that the user will be re-queried on repeat.
	throw ingo#msg#MsgFromVimException()   " Avoid E608: Cannot :throw exceptions with 'Vim' prefix
    endtry
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
