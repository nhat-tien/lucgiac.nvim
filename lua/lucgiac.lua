local M = {}

M.config = {}

function M.new_pane(direction)
	local switch = require("lucgiac.utils").switch
	local wd = vim.fn.getcwd()
	local shell = vim.o.shell
	switch(direction, {
		["float"] = function()
			M.new_pane_float(wd, shell)
		end,
		["right"] = function()
			M.new_pane_right(wd, shell)
		end,
		["down"] = function()
			M.new_pane_down(wd, shell)
		end,
	})
end

function M.new_pane_float(wd, shell)
	vim.system({ "zellij", "action", "new-pane", "-f", "--cwd", wd, "--", shell }, { text = true })
end

function M.new_pane_right(wd, shell)
	vim.system({ "zellij", "action", "new-pane", "-d", "right", "--cwd", wd, "--", shell }, { text = true })
end

function M.new_pane_down(wd, shell)
	vim.system({ "zellij", "action", "new-pane", "-d", "down", "--cwd", wd, "--", shell }, { text = true })
end

function M.test()
	return M.config.floating
end

function M.load_config(opts)
	local merge = require("lucgiac.utils").merge
	local default_config = require("lucgiac.config")
	M.config = merge(opts, default_config)
end

function M.setup(opts)
	M.load_config(opts)

	vim.api.nvim_create_user_command("LucgiacNewPaneRight", function()
		M.new_pane("right")
	end, {})
	vim.api.nvim_create_user_command("LucgiacNewPaneDown", function()
		M.new_pane("down")
	end, {})
	vim.api.nvim_create_user_command("LucgiacNewPaneFloat", function()
		M.new_pane("float")
	end, {})
end

return M
