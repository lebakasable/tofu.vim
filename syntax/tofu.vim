" Vim syntax file
" Language: tofu

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

set tabstop=4
set shiftwidth=4

syn keyword tofuKeyword import to while if elif else inline const buffer
syn match tofuKeyword "\<\(set\|deref\|cast\)\(i\|c\|b\|p\)\>" display
syn keyword tofuBool true false
syn keyword tofuType char void bool int ptr

syn match tofuConstant "\<[A-Z][A-Z0-9_]\+\>" display
syn match tofuFunction "\zs\([A-Za-z_][A-Za-z0-9_]*\)*\s*\ze\(<.*>\)\?:"
syn match tofuNumber "\<[0-9]*\>" display

syn region tofuString start=/"/ end=/"/ contains=tofuEscapes
syn match tofuChar "'\\\?.'" display contains=tofuEscapes
syntax match tofuEscapes display contained "\\[nr\"'0]"

syntax keyword tofuTodos TODO NOTE
syn region tofuComment start="#" end=/$/ contains=tofuTodos

" links
hi def link tofuKeyword  Keyword
hi def link tofuBool     Boolean
hi def link tofuType     Type
hi def link tofuConstant Constant
hi def link tofuFunction Function
hi def link tofuNumber   Number
hi def link tofuString   String
hi def link tofuChar     Character
hi def link tofuComment  Comment

let b:current_syntax = "tofu"
