vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	desc = "Check if any buffers were changed outside of Neovim",
	command = "silent! checktime",
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	desc = "Resize all windows when Neovim is resized",
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd.tabdo("wincmd =")
		vim.cmd.tabnext(current_tab)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Trim all trailing whitespace",
	callback = function()
		local cursor_position = vim.api.nvim_win_get_cursor(0)
		vim.cmd([[keeppatterns %s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, cursor_position)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Auto-create parent directories on :write",
	callback = function(opts)
		local dir = vim.fs.dirname(opts.match)
		if opts.match:find("://") == nil and vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Enable spell check on text files",
	pattern = { "text", "markdown", "asciidoc", "gitcommit", "jjdescription" },
	command = "setlocal spell",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked region",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})
