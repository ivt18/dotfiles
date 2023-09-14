let g:lightline = { 'colorscheme' : 'nord' }
" let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
" let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
" let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
" let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified', 'devicons_fileformat', 'devicons_filetype' ] ],
    \ 'right': [ [ 'lineinfo' ] ] }
let g:lightline.inactive = {
    \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
    \ 'right': [ [ 'lineinfo' ] ]
    \ }
let g:lightline.tabline = {
    \ 'left': [ [ 'vim_logo', 'tabs' ] ]
    \ }
let g:lightline.tab = {
    \ 'active': [ 'filename', 'modified' ],
    \ 'inactive': [ 'filename', 'modified' ] }
let g:lightline.tab_component_function = {
    \ 'filename': 'lightline#tab#filename',
    \ 'modified': 'lightline#tab#modified',
    \ 'readonly': 'lightline#tab#readonly'
    \ }
let g:lightline.component = {
    \ 'vim_logo': "\ue7c5",
    \ 'mode': '%{lightline#mode()}',
    \ 'filename': '%t',
    \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
    \ 'modified': '%M',
    \ 'paste': '%{&paste?"PASTE":""}',
    \ 'readonly': '%R',
    \ 'lineinfo': '%2p%% %3l:%-2v'
    \ }
let g:lightline.component_function = {
    \ 'devicons_filetype': 'GetFiletype',
    \ 'devicons_fileformat': 'GetFileformat'
    \ }

function! GetFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! GetFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
