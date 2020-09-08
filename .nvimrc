augroup usesthis
  autocmd!
  autocmd BufWriteCmd ~/dev/usesthis/posts/*.markdown silent! exec '!~/dev/usesthis/tasks/link_gear %:p' | silent! %s/[‘’]/'/g | silent! %s/[“”]/"/g | silent! %s/ — / - /g | e
augroup end
