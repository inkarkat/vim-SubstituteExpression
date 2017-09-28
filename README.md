SUBSTITUTE EXPRESSION   
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

Vim has powerful built-in functions for text manipulation, and maybe you have
written some custom ones. To apply one of those to text in the buffer, you'd
have to use sub-replace-expression, or a getline() / setline() combo.
This works for whole lines, but what if you need to change only parts?
You may have an external program that transforms text. Again, filtering entire
lines is easy with built-in :range!, but what about arbitrary text?

This plugin allows to pass text covered by a {motion}, or arbitrary visual
selections, through a queried Vimscript expression, or external shell command,
or an Ex command that is applied in a separate scratch buffer, and then
replace the original text with the result.
As substitutions are a particularly common use case, the plugin offers a
special shortcut mapping for those.

### SOURCE

Extracted from my Substitutions.vim plugin; incorporated mappings and ideas
from the Express plugin.

### RELATED WORKS

- express.vim (https://github.com/tommcdo/vim-express) by Tom McDonald offers
  an almost identical implementation. It also allows on-the-fly creation of
  operators via :MapExpress and :MapSubpress, something for which I would use
  my TextTransform.vim plugin. My plugin offers more advanced (cross-mode)
  repeats, and the :Ex-command expression variant.

USAGE
------------------------------------------------------------------------------

    g={motion}              Query for an expression, and pass the text defined by
                            {motion} to it, then replace the text in the buffer
                            with the result.
                            The expression can be:
                            - a Vimscript expression; v:val will contain the
                              text.
                            - a function name (without parentheses); the function
                              will be passed the text as a single String argument.
                            - If the expression begins with '!', it will be
                              treated as an external command, and passed to the
                              system() function, with the text as stdin. (To use
                              an expression beginning with logical not (expr-!),
                              include a space before the '!' character.)
                            - If the expression begins with ':', the text will be
                              placed in a scratch buffer (of the same 'filetype'),
                              and the Ex command(s) will be applied.

    {Visual}g=              Like g=, but for the current selection.
    g==                     Like g=, but for the current line. linewise

    g:{motion}              Like g=, but input `pattern/replace/flags` similar to
                            :substitute. Individual lines are filtered through
                            the substitute() function, as if invoked by g=
                            using 'substitute(v:val, ...)'.
                            Note: Despite looking like a :substitute command,
                            this is really one call to substitute() for each
                            line, so the behavior is slightly different.
    {Visual}g:              Like g:, but for the current selection.
    g::                     Like g:, but for the current line. linewise

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-SubstituteExpression
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim SubstituteExpression*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the ingo-library.vim plugin ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)), version 1.027 or
  higher.
- Requires the TextTransform.vim plugin ([vimscript #4005](http://www.vim.org/scripts/script.php?script_id=4005)), version 1.25 or
  higher.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

If you want to use different mappings, map your keys to the
 Plug>TextTSubstituteExpression#... mapping targets _before_ sourcing the
script (e.g. in your vimrc):

    nmap g== <Plug>TextTSubstituteExpression#ExpressionLine
    nmap g= <Plug>TextTSubstituteExpression#ExpressionOperator
    xmap g= <Plug>TextTSubstituteExpression#ExpressionVisual
    nmap g:: <Plug>TextTSubstituteExpression#SubstituteLine
    nmap g: <Plug>TextTSubstituteExpression#SubstituteOperator
    xmap g: <Plug>TextTSubstituteExpression#SubstituteVisual

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-SubstituteExpression/issues or email (address
below).

HISTORY
------------------------------------------------------------------------------

##### 1.00    25-Jul-2017
- First published version.

##### 0.01    20-Aug-2016
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2016-2017 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat <ingo@karkat.de>
