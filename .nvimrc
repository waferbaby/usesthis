augroup usesthis
  autocmd!
  autocmd BufWriteCmd ~/Development/usesthis/posts/*.markdown w | silent! exec '!~/Development/usesthis/tasks/link_gear %:p' | silent! %s/[‘’]/'/g | silent! %s/[“”]/"/g | e
augroup end
