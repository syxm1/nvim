local function load_config_files()
	local configs_path = vim.fn.stdpath("config") .. "/lua/configs"
	local config_files = vim.fn.glob(configs_path .. "/*.lua", false, true)
	for _, file in ipairs(config_files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		require("configs." .. filename)
	end
end

load_config_files()

local function load_snippet_files()
	local snippet_path = vim.fn.stdpath("config") .. "/lua/snippets"
	local snippet_files = vim.fn.glob(snippet_path .. "/*.lua", false, true)
	for _, file in ipairs(snippet_files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		require("snippets" .. filename)
	end
end

load_snippet_files()
