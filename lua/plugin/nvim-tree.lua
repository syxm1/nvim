-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true -- optionally enable 24-bit colour

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

  -- default mappings
    api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
	vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<CR>')
	vim.keymap.set('n', '<leader>c', ':NvimTreeClose<CR>')
	vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>')
end

require("nvim-tree").setup {
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
        side = "right"
    },
    renderer = {
        highlight_opened_files = "all",
        highlight_git = true,
        root_folder_modifier = ":t",
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "",
                    deleted = "",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            },
        },
        highlight_git = true,
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    on_attach = my_on_attach,
}
