local M = {}

M.__direction = ""
M.__action = ""
M.__is_floating = false

function M.new_pane(direction)
   vim.system({"zellij", "action", "new-pane", "-d", direction}, {text = true})
end

function M.new(self)
   setmetatable({}, self)
   self.__index = self
end

function M.direction(self, direction)
   self.__direction = direction
   return self
end

function M.floating(self, is_floating)
   self.__is_floating = is_floating
   return self
end

function M.excute(self)
   print(self.__direction)
   print(self.__is_floating)
end

function M.load_config(opts)
   return {}
end

function M.setup(self)
   vim.api.nvim_create_user_command("LucgiacNewPaneRight", function ()
      M.new_pane("right")
   end,{})
   vim.api.nvim_create_user_command("LucgiacNewPaneDown", function ()
      M.new_pane("down")
   end,{})
end

return M
