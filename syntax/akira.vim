if exists("b:current_syntax")
  finish
endif

if version < 600
  syn clear
endif

syn sync minlines=81

setlocal isident+=$
setlocal iskeyword+=-
setlocal iskeyword+=?

syn match akiraIdentifier /[a-zA-Z_$][0-9a-zA-Z_\-$]*[?]/
hi def link akiraIdentifier Normal

syn match akiraConditional /\<\%(if\|else\|then\)\>/
hi def link akiraConditional Conditional

syn match akiraKeyword /\<\%(recur\|not\|is\|isnt\|export\|import\)\>/
hi def link akiraKeyword Keyword

syn match akiraObject /\<\%(prototype\)\>/
hi def link akiraObject Constant

syn match akiraBoolean /\<\%(true\|false\)\>/
hi def link akiraBoolean Boolean

syn match akiraException /\<\%(try\|catch\|raise\)\>/
hi def link akiraException Exception

syn match akiraSpecialVar /\<\%(undefined\|none\|macro\|this\)\>/
hi def link akiraSpecialVar Type

syn match akiraKey /@[a-zA-Z_$][0-9a-zA-Z_\-$]*[?]\?/
hi def link akiraKey Tag

syn region akiraString start=/'/ skip=/\\\\\|\\'/ end=/'/
hi def link akiraString String

syn match akiraNumber /\i\@<!\(\-\)\?\d\+\%([0-9e,]\+\)\?/
hi def link akiraNumber Number

syn match akiraFloat /\i\@<!\d*\.\@<!\.\d\+\%([eE]\d\+\)\?/
hi def link akiraFloat Float

syn match akiraOperator /++\|+:\|!!\|>=\|>\|<=\|<\|==\|!=\|&&\|||/
hi def link akiraOperator Operator

syn match akiraFunction /->\|fn/
hi def link akiraFunction Function

syn match akiraFunctionCall /[a-zA-Z_$][0-9a-zA-Z_\-$]*[?]\?:/
hi def link akiraFunctionCall Macro

syn keyword akiraTodo TODO FIXME XXX contained
hi def link akiraTodo Todo

syn match akiraComment /--.*/ contains=@Spell,akiraTodo
hi def link akiraComment Comment

syn region akiraRegex start=/\%(\%()\|\i\@<!\d\)\s*\|\i\)\@<!\/\s\@!/
\                      skip=/\[[^\]]\{-}\/[^\]]\{-}\]/
\                      end=/\/[gimy]\{,4}\d\@!/
hi def link akiraRegex String

if !exists("akira_no_trailing_space_error")
  syn match akiraSpaceError /\S\@<=\s\+$/ display
  hi def link akiraSpaceError Error
endif

let b:current_syntax = "akira"
