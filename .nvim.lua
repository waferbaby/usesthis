vim.api.nvim_create_autocmd(
  "BufWriteCmd", {
    pattern = "*.markdown",
    callback = function(event)
      local result = vim.fn.system({ "ruby", "./tasks/link_gear", event.match })
      vim.cmd.edit()
    end
  }
)
