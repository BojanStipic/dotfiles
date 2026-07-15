vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0

vim.opt.spelllang = { "en", "sr@latin" }
vim.opt.scrolloff = 10
vim.opt.smoothscroll = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "indent"
vim.opt.foldtext = ""
vim.opt.diffopt:append({
	"algorithm:histogram",
	"vertical",
	"followwrap",
})
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fileignorecase = true
vim.opt.wrapscan = false
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }
vim.opt.modeline = false
vim.opt.showmode = false
vim.opt.number = true
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn = "yes:2"
vim.opt.colorcolumn = "81"
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·" }
vim.opt.timeoutlen = 2000
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 300
vim.opt.mousescroll = { "ver:1", "hor:1" }
vim.opt.shortmess:append({ A = true, c = true })
vim.opt.winborder = "rounded"
vim.opt.exrc = true
vim.g.clipboard = "osc52"
require("vim._core.ui2").enable()

vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.backup = false

vim.diagnostic.config({
	severity_sort = true,
	jump = { wrap = false, float = true },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "●",
			[vim.diagnostic.severity.WARN] = "●",
			[vim.diagnostic.severity.INFO] = "●",
			[vim.diagnostic.severity.HINT] = "●",
		},
	},
})
