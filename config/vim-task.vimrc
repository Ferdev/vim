autocmd BufNewFile,BufRead todo.txt,*.task,*.tasks set ft=task
noremap <silent> <buffer> cc :call Toggle_task_status()<CR>
