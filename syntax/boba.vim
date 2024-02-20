" Vim syntax file
" Language: boba

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

set tabstop=4
set shiftwidth=4

syn keyword bobaKeyword import to while if elif else inline const buffer
syn match bobaKeyword "\<\(set\|deref\|cast\)\(i\|c\|b\|p\)\>" display
syn keyword bobaBool true false
syn keyword bobaType char void bool int ptr

syn match bobaConstant "\<[A-Z][A-Z0-9_]\+\>" display
syn match bobaFunction "\zs\([A-Za-z_][A-Za-z0-9_]*\)*\s*\ze\(<.*>\)\?:"
syn match bobaNumber "\<[0-9]*\>" display

syn region bobaString start=/"/ end=/"/ contains=bobaEscapes
syn match bobaChar "'\\\?.'" display contains=bobaEscapes
syntax match bobaEscapes display contained "\\[nr\"'0]"

syntax keyword bobaTodos TODO NOTE
syn region bobaComment start="#" end=/$/ contains=bobaTodos

" links
hi def link bobaKeyword  Keyword
hi def link bobaBool     Boolean
hi def link bobaType     Type
hi def link bobaConstant Constant
hi def link bobaFunction Function
hi def link bobaNumber   Number
hi def link bobaString   String
hi def link bobaChar     Character
hi def link bobaComment  Comment

let b:current_syntax = "boba"
