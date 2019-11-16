" ===============================================
" Lightline
" ===============================================
let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [[ 'exit' ]],
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }
let g:lightline#bufferline#shorten_path = 1
let g:lightline = { 'colorscheme': 'moonfly' }
let g:lightline#bufferline#enable_devicons = 1

" ===============================================
" NCM2
" ===============================================
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" set completeopt to be what ncm2 expects
set completeopt=noinsert,menuone,noselect

" ===============================================
" FZF
" ===============================================
nnoremap <C-p> :Files<ENTER>
if has('nvim')
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
  aug END
end
" allow fzf to work with devicons
function! Fzf_dev()
  function! s:files()
    let files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(files)
  endfunction

  function! s:prepend_icon(candidates)
    let result = []
    for candidate in a:candidates
      let filename = fnamemodify(candidate, ':p:t')
      let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
      call add(result, printf("%s %s", icon, candidate))
    endfor

    return result
  endfunction

  function! s:edit_file(item)
    let parts = split(a:item, ' ')
    let file_path = get(parts, 1, '')
    execute 'silent e' file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m -x +s',
        \ 'down':    '40%' })
endfunction


command! FilesWithIcon :call Fzf_dev()
