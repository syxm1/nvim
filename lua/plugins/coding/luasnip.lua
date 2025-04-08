return {
	"L3MON4D3/LuaSnip",

	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},

	config = function()
    local function load_snippet_files()
      local snippet_path = vim.fn.stdpath("config") .. "/lua/snippets"
      local snippet_files = vim.fn.glob(snippet_path .. "/*.lua", false, true)
      for _, file in ipairs(snippet_files) do
        local filename = vim.fn.fnamemodify(file, ":t:r")
        require("snippets." .. filename)
      end
    end

    load_snippet_files()

		local ls = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()

		vim.keymap.set({ "i" }, "<C-K>", function()
			ls.expand()
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-L>", function()
			ls.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-J>", function()
			ls.jump(-1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
}
