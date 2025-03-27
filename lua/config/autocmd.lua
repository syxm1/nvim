local augroup = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	group = augroup,
	pattern = "*",
	callback = function()
		if vim.wo.nu and vim.fn.mode() ~= "i" then
			vim.wo.rnu = true
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	group = augroup,
	pattern = "*",
	callback = function()
		if vim.wo.nu then
			vim.wo.rnu = false
		end
	end,
})
