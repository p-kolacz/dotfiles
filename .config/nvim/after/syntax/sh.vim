syn include @AWKScript syntax/awk.vim

syn region AWKScriptEmbedded matchgroup=AWKCommand
    \ start=+\<g\?awk\>+ skip=+\\$+ end=+[=\\]\@<!'+me=e-1
    \ contains=@shIdList,@shExprList2 nextgroup=AWKScriptCode
syn region AWKScriptEmbedded matchgroup=AWKCommand
    \ start=+\$AWK\>+ skip=+\\$+ end=+[=\\]\@<!'+me=e-1
    \ contains=@shIdList,@shExprList2 containedin=shDerefSimple nextgroup=AWKScriptCode

syn cluster shCommandSubList add=AWKScriptEmbedded
hi def link AWKCommand Type
