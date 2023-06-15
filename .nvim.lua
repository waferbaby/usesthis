vim.api.nvim_create_autocmd(
  "BufWriteCmd", {
    pattern = "*.markdown",
    command = "silent! exec '!./tasks/link_gear %:p' | e"
  }
)
