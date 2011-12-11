" Vim syntax file
" Language: HTML + MODX
" Maintainer: Ross Timson <ross@rosstimson.com>
" Version: 0.1
" Last Change: 11 December 2011

" Quit when a syntax file is already loaded.
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'modx'
endif

" Include HTML
runtime syntax/html.vim
unlet b:current_syntax

" Add modxTag support into HTML elements
syn region htmlTag start=+<[^/]+   end=+>+ contains=modxTag,htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
syn region  htmlString   contained start=+"+ end=+"+ contains=modxTag,htmlSpecialChar,javaScriptExpression,@htmlPreproc
syn region  htmlString   contained start=+'+ end=+'+ contains=modxTag,htmlSpecialChar,javaScriptExpression,@htmlPreproc


" Regexes for MODX tags (contained within 2 square brackets)
"       Resource Tag / TV       [[*ResourceField / TvName ]]
"       Chunk Tag               [[$ChunkName]]
"       Snippet Tag             [[SnippetName]]
"       Placeholder Tag         [[+PlaceholderName]]
"       Link Tag                [[~ResourceID]]
"       Setting Tag             [[++SettingName]]
"       Language Tag            [[%LanguageStringKey]]

syn region modxTag matchgroup=Type start=+\[\[+ end=+\]\]+ keepend contains=modxResourceTag,modxChunkTag,modxSnippetTag,modxPlaceholderTag,modxLinkTag,modxSettingTag,modxLanguageTag,modxParams

syn match modxResourceTag     "\v\[*]\w"      contains=modxConditional,modxFunction,modxKeyword contained
syn match modxChunkTag        "\v\[$]\w"      contains=modxConditional,modxFunction,modxKeyword contained
syn match modxSnippetTag      "\v\w"          contains=modxConditional,modxFunction,modxKeyword contained
syn match modxPlaceholderTag  "\v[+]\w"       contains=modxConditional,modxFunction,modxKeyword contained
syn match modxLinkTag         "\v[~]\w"       contains=modxConditional,modxFunction,modxKeyword contained
syn match modxSettingTag      "\v\+{2}.*\w"   contains=modxConditional,modxFunction,modxKeyword contained
syn match modxLanguageTag     "\v[%]\w"       contains=modxConditional,modxFunction,modxKeyword contained


"hi def link modxTag               Keyword
hi def link modxResourceTag       Keyword
hi def link modxChunkTag          Keyword
hi def link modxSnippetTag        Keyword
hi def link modxPlaceholderTag    Keyword
hi def link modxLinkTag           Keyword
hi def link modxSettingTag        Keyword
hi def link modxLanguageTag       Keyword

syn region modxParams matchgroup=String start=+`+ end=+`+ keepend contains=modxParams contained
syn match modxParams          "\v`[a-zA-Z0-9]*`" contained
hi def link modxParams            String

" Output Modifiers
syn keyword modxConditional if input contained
syn keyword modxConditional is equals eq equalto isequal isequalto contained
syn keyword modxConditional isnot isnt ne neq notequals notequalto contained
syn keyword modxConditional gt isgt greaterthan isgreaterthan contained
syn keyword modxConditional lt islt lessthan lowerthan islessthan islowerthan contained
syn keyword modxConditional gte isgte eg ge equalorgreaterthan greaterthanorequalto contained
syn keyword modxConditional lte islte el le lessthanorequalto equaltoorlessthan contained
syn keyword modxConditional and then else contained

syn keyword modxKeyword show hide contained
syn keyword modxKeyword select contained
syn keyword modxKeyword memberof mo ismember contained

" String Modifiers
syn keyword modxFunction cat contained
syn keyword modxFunction lcase lowercase strtolower contained
syn keyword modxFunction ucase uppercase strtoupper contained
syn keyword modxFunction ucwords contained
syn keyword modxFunction ucfirst contained
syn keyword modxFunction htmlent htmlentities contained
syn keyword modxFunction esc escape contained
syn keyword modxFunction strip contained
syn keyword modxFunction notags striptags strip_tags contained
syn keyword modxFunction length len strlen contained
syn keyword modxFunction reverse strrev contained
syn keyword modxFunction wordwrap wordwrapcut n12br contained
syn keyword modxFunction limit ellipsis contained
syn keyword modxFunction cdata contained

" Special Functions
syn keyword modxFunction tag contained
syn keyword modxFunction math contained
syn keyword modxFunction add increment inc contained
syn keyword modxFunction subtract decrement decr contained
syn keyword modxFunction multiply mpy contained
syn keyword modxFunction divide div contained
syn keyword modxFunction modulus mod contained
syn keyword modxFunction ifempty default isempty empty contained
syn keyword modxFunction ifnotempty isnotempty notempty !empty contained
syn keyword modxFunction data contained
syn keyword modxFunction strtotime contained
syn keyword modxFunction md5 contained
syn keyword modxFunction userinfo contained
" TODO Define Userinfo fields
" syn keyword modx????? username fullname dob gender photo
" syn keyword modx????? email phone mobilephone fax
" syn keyword modx????? country state zip
" syn keyword modx????? blocked blockeduntil logincount
" syn keyword modx????? comment
syn keyword modxFunction isloggedin isnotloggedin contained

hi def link modxConditional       Underlined
hi def link modxKeyword           Function
hi def link modxFunction          Function

let b:current_syntax = 'modx'

if main_syntax == 'modx'
  unlet main_syntax
endif
