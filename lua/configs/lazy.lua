-- bootstrap lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- load all folder under lua/plugins recursively
local function get_plugin_specs(base_path)
	base_path = base_path or vim.fn.stdpath("config") .. "/lua/plugins"
	local plugin_specs = {}

	local plugin_dirs = vim.fn.glob(base_path .. "/*/", false, true)
	for _, dir in ipairs(plugin_dirs) do
		local dirname = vim.fn.fnamemodify(dir, ":h:t")

		if dirname ~= "" then
			local rel_path = dir:gsub(vim.fn.stdpath("config") .. "/lua/", "")
			rel_path = rel_path:gsub("/$", "")
			table.insert(plugin_specs, { import = rel_path:gsub("/", ".") })

			local sub_specs = get_plugin_specs(dir)
			for _, spec in ipairs(sub_specs) do
				table.insert(plugin_specs, spec)
			end
		end
	end

	return plugin_specs
end

require("lazy").setup(get_plugin_specs(), {
	install = {
		colorscheme = { "catppuccin-macchiato" },
	},
	spec = {},
	ui = {
		size = { width = 0.8, heigth = 0.8 },
		border = "rounded",
		title = "",
		icons = {},
	},
})
