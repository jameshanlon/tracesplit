" Vim syntax file
" Language: trace

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn match sOut     "^.* out .*$"
syn match sOut     "^.* outct .*$"
syn match sIn      "^.* in .*$"
syn match sIn      "^.* inct .*$"
syn match sIn      "^.* chkct .*$"
syn match sFrame   "^.* entsp .*"
syn match sFrame   "^.* retsp .*"
syn match sEvent   "^.* Event .*$"
syn match sComment  "%.*"

if version >= 508 || !exists("did_x_syntax_inits")
  if version < 508
    let did_x_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
" String - red
" Comment - blue
" Keyword - yellow
" Structure - green

"  HiLink sKeyword     Keyword
"  HiLink sBuiltin     Function
"  HiLink sType        Type
"  HiLink sStructure   Structure
"  HiLink sRepeat      Repeat
"  HiLink sIdentifier  Identifier
"  HiLink sOperator    Operator
"  HiLink sNumber      Number
"  HiLink sBrackets    Type
"  HiLink sParentheses Delimiter
"  HiLink sString      String
"  HiLink sCharString  String
"  HiLink sComment     Comment
   HiLink sOut     Structure
   HiLink sIn      Keyword
   HiLink sFrame   Comment
   HiLink sEvent   String

  delcommand HiLink
endif

let b:current_syntax = "trace"

" vim: ts=8
