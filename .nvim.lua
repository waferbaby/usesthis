vim.api.nvim_create_autocmd(
  "BufWriteCmd", {
    pattern = "*.markdown",
    command = "silent! exec '!ruby ~/dev/usesthis/tasks/link_gear %:p' | e"
  }
)
