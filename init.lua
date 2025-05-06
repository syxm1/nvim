vim.g.mapleader = " "

local function load_config_files()
	local configs_path = vim.fn.stdpath("config") .. "/lua/configs"
	local config_files = vim.fn.glob(configs_path .. "/*.lua", false, true)
	for _, file in ipairs(config_files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		require("configs." .. filename)
	end
end

load_config_files()
