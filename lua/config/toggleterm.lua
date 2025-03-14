-- init.lua or your Lua configuration file
require("toggleterm").setup{
  -- Configuration options
    size = 60,  -- Number of lines or width in columns (depending on orientation)
    open_mapping = [[<c-\>]],  -- Key mapping to toggle terminal (Ctrl + \)
    hide_numbers = true,  -- Hide line numbers in terminal
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,  -- Darken terminal background (0-100)
    start_in_insert = true,
    insert_mappings = true,  -- Whether to use insert mappings
    terminal_mappings = true,  -- Whether to use terminal mappings
    persist_size = true,  -- Persist terminal size across sessions
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'curved' -- ... other options supported by win open
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
    },
    direction = 'float',  -- Use vertical positioning
}

-- Optional: Set up key mappings for opening terminals
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })
