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
hi def link akiraIdentifier Identifier

syn keyword akiraConditional if else then
hi def link akiraConditional Conditional

syn keyword akiraKeyword recur cond export import let module
hi def link akiraKeyword Keyword

syn keyword akiraObject prototype
hi def link akiraObject Type

syn keyword akiraBoolean true false
hi def link akiraBoolean Boolean

syn keyword akiraException try catch raise
hi def link akiraException Exception

syn keyword akiraTypeVar undefined none this
hi def link akiraTypeVar Type

syn match akiraArguments /&[0-9]*/
hi def link akiraArguments Type

syn keyword akiraTypeDefs Function Number String Vector Maybe Map None RegExp Boolean Any
hi def link akiraTypeDefs TypeDef

syn match akiraKey /@[a-zA-Z_$][0-9a-zA-Z_\-$]*[?]\?/
hi def link akiraKey Constant

syn region akiraString start=/'/ skip=/\\\\\|\\'/ end=/'/
hi def link akiraString String

syn match akiraNumber /\i\@<!\(\-\)\?\d\+\%([0-9e]\+\)\?/
hi def link akiraNumber Number

syn match akiraFloat /\i\@<!\d*\.\@<!\.\d\+\%([eE]\d\+\)\?/
hi def link akiraFloat Float

syn keyword akiraOperatorWord is isnt not
syn match akiraOperator /&!\|<-\|::\|++\|+:\|!!\|>=\|>\|<=\|<\|==\|!=\|!\|&&\|||/
hi def link akiraOperatorWord Operator
hi def link akiraOperator Operator

syn keyword akiraFunctionWord fn match
syn match akiraFunction /->/
hi def link akiraFunctionWord Special
hi def link akiraFunction Special

syn keyword akiraSpecial do maybe macro
hi def link akiraSpecial Special

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
