local M = {}

function M.setup(_)
   vim.api.nvim_create_user_command("Hello", function ()
      print("Hello")
   end, {})
end

return M
