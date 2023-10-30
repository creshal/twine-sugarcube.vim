" Vim syntax file
" Language: twsc
" Original Author: thricedotted@gmail.com / who even knows
" Maintainer: Samuel Creshal <samuel@creshal.de>
" Latest Revision: 30 Oct 2023
" Version: 0.2
"
" TODO:
"   - numbers in <<macros>> could be way more robust
"   - different highlighting for choices and actions?
"   - folding stuff???
"   - gui colors/formatting
"   - ugh, probably a lot of things

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'twsc'
endif

" Use HTML as base syntax, then add Sugarcube as "sugar" on top
runtime! syntax/html.vim
unlet b:current_syntax

" special words
syn keyword     twscBuiltin         if else elseif endif choice actions set remember print silently endsilently return contained
syn keyword     twscKeywords        lt lte gt gte eq not and or contained
syn keyword     twscToDo            TODO XXX FIXME

" stuff inside macros
syn match       twscArithmetic      '[=+-/\*\.]' contained
syn match       twscVariable        '\$[A-Za-z0-9_]*' contained
syn match       twscNumber          '[0-9]' contained 
syn match       twscString          '\".\{-}\"' contained

" twsc code things
syn match       twscTitle           '^::.*$' contains=twscTags
syn match       twscMacro           '<<.\{-}>>' contains=twscNumber,twscBuiltin,twscVariable,twscString,twscKeywords,twscArithmetic
syn region      twscLink            start="\[\[" end="\]\]"
syn match       twscTags            '\[.*\]' contained
syn region      twscComment         start="/%" end="%/"

" line break escape character -- see http://www.glorioustrainwrecks.com/node/5400
syn match       twscEOL             '\\$'

" Highlight embedded JS properly -- since this is a special case of twscMacro,
" it has to be defined after it
syn include @js syntax/javascript.vim
syn region inlinejs matchgroup=IJS start='<<script>>' end='<</script>>' contains=@js
hi link IJS Conditional

" other text formatting
syn match       twscItalic          '//.\{-}//'
syn match       twscUnderline       '__.\{-}__'
syn match       twscBold            "''.\{-}''"
syn match       twscList            '^[*#]'

hi def      twscTitle           term=bold cterm=bold
hi def link twscKeywords        Function

hi def link twscToDo            ToDo
hi def link twscBuiltin         Conditional
hi def link twscVariable        Identifier

hi def link twscNumber          Number
hi def link twscString          String

hi def link twscTags            Type
hi def link twscEOL             Comment
hi def link twscKeywords        Function
hi def link twscMacro           Function
hi def link twscComment         Comment

hi def twscLink                 term=underline cterm=underline
hi def twscItalic               term=italic cterm=italic
hi def twscUnderline            term=underline cterm=underline
hi def twscBold                 term=bold cterm=bold
hi def twscList                 term=bold cterm=bold


let b:current_syntax = "twsc"
if main_syntax == 'twsc'
  unlet main_syntax
endif
