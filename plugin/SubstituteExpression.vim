" SubstituteExpression.vim: Pass text through an expression.
"
" DEPENDENCIES:
"   - SubstituteExpression.vim autoload script
"   - TextTransform.vim .vim autoload script
"
" Copyright: (C) 2016 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	001	20-Aug-2016	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_SubstituteExpression') || (v:version < 700)
    finish
endif
let g:loaded_SubstituteExpression = 1

call TextTransform#MakeMappings('', 'g=', 'SubstituteExpression#Expression')
call TextTransform#MakeMappings('', 'g:', 'SubstituteExpression#Substitute')

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
