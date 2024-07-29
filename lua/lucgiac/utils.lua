local M = {}

M.merge = function (t1, t2)
   if t2 == nil then
      return t1
   end

   for k, v in pairs(t2) do
      t1[k] = v
   end

   return t1
end

M.switch = function (val, case)
   case[val]()
end

return M
