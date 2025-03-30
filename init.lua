-- load all local configs
local function load_configs()
	local configs_path = vim.fn.stdpath("config") .. "/lua/configs"
	local config_files = vim.fn.glob(configs_path .. "/*.lua", false, true)
	for _, file in ipairs(config_files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		require("configs." .. filename)
	end
end

load_configs()

local function load_lsp()
	local lsp_path = vim.fn.stdpath("config") .. "/lua/configs/lsp"
	local lsp_files = vim.fn.glob(lsp_path .. "/*.lua", false, true)
	for _, file in ipairs(lsp_files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		require("configs.lsp." .. filename)
	end
end

load_lsp()

-- load all snippets
local function load_snippets()
	local snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"
	local snippet_files = vim.fn.glob(snippets_path .. "/*.lua", false, true)
	for _, file in ipairs(snippet_files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		require("snippets." .. filename)
	end
end

load_snippets()
