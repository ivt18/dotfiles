" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '->'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 1

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'            , 'comment' ]
let g:which_key_map['f'] = [ ':Files'                           , 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'                               , 'split below']
let g:which_key_map['v'] = [ '<C-W>v'                               , 'split right']
let g:which_key_map['T'] = [ ':Rg'                                  , 'search text' ]

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" c is for coc
let g:which_key_map.o = {
    \ 'name' : '+coc' ,
    \ 'a' : ['<Plug>(coc-codeaction)'               , 'codeaction'],
    \ 'd' : ['<Plug>(coc-definition'                , 'definition'],
    \ 'r' : ['<Plug>(coc-references)'               , 'references'],
    \ 't' : ['<Plug>(coc-type-definition'           , 'type definition'],
    \ 'R' : ['<Plug>(coc-rename)'                   , 'rename'],
    \ 'D' : ['<Plug>(coc-declaration)'              , 'goto declaration'],
    \ 'i' : ['<Plug>(coc-implementation)'           , 'goto implementation'],
    \ 'f' : ['<Plug>(coc-format)'                   , 'format'],
    \ 'F' : ['<Plug>(coc-fix-current)'              , 'fix current'],
    \ 'A' : ['<Plug>(coc-codelens-action)'          , 'codelens action'],
    \ 'n' : ['<Plug>(coc-diagnostic-next)'          , 'diagnostic next'],
    \ 'e' : ['<Plug>(coc-diagnostic-next-error)'    , 'diagnostic next error'],
    \ ';' : [':CocList diagnostics<CR>'             , 'diagnostics'],
    \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
