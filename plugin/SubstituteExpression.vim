" SubstituteExpression.vim: Pass text through an expression.
"
" DEPENDENCIES:
"   - TextTransform.vim plugin
"
" Copyright: (C) 2016-2020 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_SubstituteExpression') || (v:version < 700)
    finish
endif
let g:loaded_SubstituteExpression = 1

call TextTransform#MakeMappings('', '', 'SubstituteExpression#Expression')
call TextTransform#MakeMappings('', '', 'SubstituteExpression#Substitute')

if ! hasmapto('<Plug>TextTSubstituteExpression#ExpressionLine', 'n')
    nmap g== <Plug>TextTSubstituteExpression#ExpressionLine
endif
if ! hasmapto('<Plug>TextTSubstituteExpression#ExpressionOperator', 'n')
    nmap g= <Plug>TextTSubstituteExpression#ExpressionOperator
endif
if ! hasmapto('<Plug>TextTSubstituteExpression#ExpressionVisual', 'x')
    xmap g= <Plug>TextTSubstituteExpression#ExpressionVisual
endif
if ! hasmapto('<Plug>TextTSubstituteExpression#SubstituteLine', 'n')
    nmap g:: <Plug>TextTSubstituteExpression#SubstituteLine
endif
if ! hasmapto('<Plug>TextTSubstituteExpression#SubstituteOperator', 'n')
    nmap g: <Plug>TextTSubstituteExpression#SubstituteOperator
endif
if ! hasmapto('<Plug>TextTSubstituteExpression#SubstituteVisual', 'x')
    xmap g: <Plug>TextTSubstituteExpression#SubstituteVisual
endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
