" Display Table Name for current Rails model file

function! s:DisplayTableSummary() abort
  call popup_create(systemlist(s:table_info_query()), s:popup_options)
endfunction

let s:popup_options =
  \ {
  \   'close': 'button',
  \   'border': [1,1,1,1],
  \   'drag': 1,
  \   'maxheight': 50,
  \   'scrollbar': 1,
  \   'resize': 1
  \ }
let s:plugin_root = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:table_info_query() abort
  return "psql -d " . s:database_name() . " -c '\\d " . s:table_name() . "'"
endfunction

function! s:table_name() abort
  return trim(system(s:plugin_root . "/bin/table-name-rails  . expand("%")))
endfunction

function! s:database_name() abort
  if exists('g:display_table_database_name')
    return g:display_table_database_name
  else
    if executable('yq')
      return trim(system("cat config/database.yml | yq read - development.database"))
    else
      return trim(system("basename $(pwd)")) . "_development"
    end
  endif
endfunction

command! DisplayTableSummary call s:DisplayTableSummary()
nnoremap <leader>dt :DisplayTableSummary<cr>

" vim:ft=vim
