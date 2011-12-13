" Vim syntax file
" Language: HTML (extended highlighting for MODX tags)
" Maintainer: Ross Timson <ross@rosstimson.com>
" Version: 0.2
" Last Change: 13 December 2011

" Regexes for MODX tags (contained within 2 square brackets)
"       Resource Tag / TV       [[*ResourceField / TvName ]]
"       Chunk Tag               [[$ChunkName]]
"       Snippet Tag             [[SnippetName]]
"       Placeholder Tag         [[+PlaceholderName]]
"       Link Tag                [[~ResourceID]]
"       Setting Tag             [[++SettingName]]
"       Language Tag            [[%LanguageStringKey]]

syn region modxTag matchgroup=Type start=+\[\[+ end=+\]\]+ contains=modxResourceTag,modxChunkTag,modxSnippetTag,modxPlaceholderTag,modxLinkTag,modxSettingTag,modxLanguageTag,modxParamName,modxParams,modxComment
" Disinguish between cached and non-cached tags.
syn region modxTag matchgroup=Special start=+\[\[!+ end=+\]\]+ contains=modxResourceTag,modxChunkTag,modxSnippetTag,modxPlaceholderTag,modxLinkTag,modxSettingTag,modxLanguageTag,modxParamName,modxParams,modxComment

syn match modxResourceTag     "\v\*\w*"       contains=modxTag,modxConditional,modxFunction,modxKeyword contained
syn match modxChunkTag        "\v\$\w*"       contains=modxTag,modxConditional,modxFunction,modxKeyword contained
syn match modxSnippetTag      "\v\w*"         contains=modxTag,modxConditional,modxFunction,modxKeyword contained
syn match modxPlaceholderTag  "\v\+\w*"       contains=modxTag,modxConditional,modxFunction,modxKeyword contained
syn match modxLinkTag         "\v\~\w*"       contains=modxTag,modxConditional,modxFunction,modxKeyword contained
syn match modxSettingTag      "\v\+{2}\w*"    contains=modxTag,modxConditional,modxFunction,modxKeyword contained
syn match modxLanguageTag     "\v\%\w*"       contains=modxTag,modxConditional,modxFunction,modxKeyword contained
syn match modxComment         "\v\-\w*"       contained

"hi def link modxTag               Keyword
hi def link modxResourceTag       Keyword
hi def link modxChunkTag          Keyword
hi def link modxSnippetTag        Keyword
hi def link modxPlaceholderTag    Keyword
hi def link modxLinkTag           Keyword
hi def link modxSettingTag        Keyword
hi def link modxLanguageTag       Keyword
hi def link modxComment           Comment
hi def link modxCacheable         Special

" Regexes for Params / Properties / Filters
syn match modxParamName           "\v\&(\w*)\=" contained
syn match modxParamName           "\v:(\w*)\=" contained
hi def link modxParamName         Identifier
syn match modxParams              "\v`(\w*)`" contained
syn match modxParams              "\v\@\w*" contained
hi def link modxParams            String

" Add MODX tags to htmlTop cluster, HTML tags such as H1-H6, <strong>, <em>,
" <i>, <b> etc. all inherit this - Keep HTML default highlighting but also
" highlight MODX tags if present.
syn cluster htmlTop contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,javaScript,@htmlPreproc,modxTag
" Allow MODX tag highlghting in <title>
syn region htmlTitle start="<title\>" end="</title>"me=e-8 contains=htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc,modxTag
" Allow MODX tags withing HTML strings including links
syn region  htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,modxTag
syn region  htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,modxTag
" Allow MODX tag highlighting in link text
syn region htmlLink start="<a\>\_[^>]*\<href\>" end="</a>"me=e-4 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc,modxTag

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
