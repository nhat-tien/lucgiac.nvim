local M = {}

function M.new_pane(direction)
   vim.system({"zellij", "action", "new-pane", direction})
end

function M.load_config(opts)
   return {}
end

function M.setup(opts)
   local config = M.load_config(opts)

   vim.api.nvim_create_user_command("LucgiacNewPaneRight", function ()
      M.new_pane("right")
   end , {})
   vim.api.nvim_create_user_command("LucgiacNewPaneLeft", function ()
      M.new_pane("left")
   end, {})
end

return M
