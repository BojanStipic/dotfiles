-- Builtin plugins
vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<space>u", function()
	require("undotree").open({ command = "80vnew" })
end)
vim.cmd.packadd("nvim.difftool")

-- External plugins
vim.pack.add({
	"https://github.com/mason-org/mason.nvim",

	"https://github.com/nvim-mini/mini.icons",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	"https://github.com/nvim-lualine/lualine.nvim",

	"https://github.com/stevearc/oil.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/Wansmer/treesj",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/folke/persistence.nvim",
	"https://github.com/tpope/vim-abolish",
	"https://github.com/tpope/vim-sleuth",

	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/dlyongemallo/diffview-plus.nvim",

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mfussenegger/nvim-jdtls",
})

-- Icons
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()

-- Colorscheme
require("catppuccin").setup({
	lsp_styles = {
		underlines = {
			errors = { "undercurl" },
			hints = { "undercurl" },
			warnings = { "undercurl" },
			information = { "undercurl" },
			ok = { "undercurl" },
		},
	},
})
vim.cmd.colorscheme("catppuccin-nvim")

-- Statusline
require("lualine").setup({
	options = {
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_b = { "diff", "diagnostics" },
		lualine_c = {
			{ "filename", path = 1 },
		},
		lualine_x = {},
		lualine_y = { "filetype", "lsp_status" },
		lualine_z = { "progress", "location" },
	},
	inactive_sections = {
		lualine_c = {
			{ "filename", path = 1 },
		},
	},
	tabline = {
		lualine_a = {
			{ "tabs", max_length = vim.o.columns, mode = 2 },
		},
	},
	extensions = { "man", "quickfix", "oil" },
})

-- File browser
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	use_default_keymaps = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<cr>"] = "actions.select",
		["<c-p>"] = "actions.preview",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["g."] = "actions.toggle_hidden",
		["gx"] = "actions.open_external",
	},
})
vim.keymap.set("n", "-", require("oil").open)

-- Text editing
require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<c-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<c-e"] = { "hide", "fallback" },
		["<cr>"] = { "accept", "fallback" },
		["<c-n>"] = { "select_next", "fallback" },
		["<c-p>"] = { "select_prev", "fallback" },
		["<c-j>"] = { "snippet_forward", "fallback" },
		["<c-k>"] = { "snippet_backward", "fallback" },
		["<c-f>"] = { "scroll_documentation_down", "fallback" },
		["<c-b>"] = { "scroll_documentation_up", "fallback" },
		["<c-d>"] = { "scroll_documentation_down", "fallback" },
		["<c-u>"] = { "scroll_documentation_up", "fallback" },
	},
	completion = {
		list = { selection = { preselect = false, auto_insert = true } },
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
	},
	signature = { enabled = true },
})

require("mini.surround").setup({
	silent = true,
	n_lines = 1000,
	mappings = {
		add = "s",
		delete = "ds",
		replace = "cs",
	},
})

require("treesj").setup({ use_default_keymaps = false })
vim.keymap.set("n", "<space>j", require("treesj").toggle)

-- Extras
require("snacks").setup({
	bigfile = { enabled = true },
	image = { enabled = true },
	input = { enabled = true },
	indent = { enabled = true },
	scope = { enabled = true },
	statuscolumn = { enabled = true },
	picker = {
		enabled = true,
		main = { current = true },
		matcher = {
			sort_empty = true,
			frecency = true,
		},
		formatters = {
			file = { truncate = 999 },
		},
		layouts = {
			custom = {
				reverse = true,
				layout = {
					width = 0.8,
					height = 0.8,
					min_width = 120,
					box = "vertical",
					border = true,
					title = "{title} {live} {flags}",
					{ win = "preview", height = 0.5, border = "bottom", title = "{preview}" },
					{ win = "list", height = 0.5, border = "none" },
					{ win = "input", height = 1, border = "top" },
				},
			},
		},
		layout = { preset = "custom" },
		win = {
			input = {
				keys = {
					["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
					["<c-a>"] = { "toggle_ignored", mode = { "i", "n" } },
				},
			},
		},
		sources = {
			files = { hidden = true, follow = true },
			grep = { hidden = true, follow = true },
			lsp_declarations = { jump = { reuse_win = false } },
			lsp_definitions = { jump = { reuse_win = false } },
			lsp_implementations = { jump = { reuse_win = false } },
			lsp_type_definitions = { jump = { reuse_win = false } },
			lsp_references = { jump = { reuse_win = false } },
		},
	},
})

vim.keymap.set("n", "<space><space>", require("snacks").picker.resume)
vim.keymap.set("n", "<space>p", require("snacks").picker.files)
vim.keymap.set("n", "<space>b", require("snacks").picker.buffers)
vim.keymap.set("n", "<space>g", require("snacks").picker.grep)
vim.keymap.set("n", "<space>*", require("snacks").picker.grep_word)
vim.keymap.set("n", "<space>d", require("snacks").picker.diagnostics)
vim.keymap.set("n", "z=", require("snacks").picker.spelling)

-- Sessions
require("persistence").setup({})
vim.keymap.set("n", "<space>q", require("persistence").load)

-- VCS
require("gitsigns").setup({
	signs = {
		untracked = { text = "┃" },
	},
	on_attach = function(bufnr)
		local opts = { buffer = bufnr, silent = true }

		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
				return
			end
			require("gitsigns").nav_hunk("next")
		end, opts)

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
				return
			end
			require("gitsigns").nav_hunk("prev")
		end, opts)

		vim.keymap.set({ "n", "v" }, "<space>hs", ":Gitsigns stage_hunk<cr>", opts)
		vim.keymap.set({ "n", "v" }, "<space>hr", ":Gitsigns reset_hunk<cr>", opts)
		vim.keymap.set("n", "<space>hS", require("gitsigns").stage_buffer, opts)
		vim.keymap.set("n", "<space>hR", require("gitsigns").reset_buffer, opts)
		vim.keymap.set("n", "<space>hp", require("gitsigns").preview_hunk_inline, opts)
		vim.keymap.set("n", "<space>hb", function()
			require("gitsigns").blame_line({ full = true })
		end, opts)
	end,
})

require("diffview").setup({
	preferred_adapter = "jj",
	view = {
		default = {
			winbar_info = true,
		},
		merge_tool = {
			layout = "diff1_plain",
		},
	},
	file_panel = {
		listing_style = "list",
	},
	keymaps = {
		file_history_panel = {
			["o"] = require("diffview.config").actions.open_in_diffview,
		},
	},
})
vim.keymap.set("n", "<space>c", "<cmd>DiffviewOpen<cr>")
vim.keymap.set("n", "<space>C", "<cmd>DiffviewOpen origin/HEAD...HEAD<cr>")
vim.keymap.set("n", "<space>hh", "<cmd>DiffviewFileHistory<cr>")
vim.keymap.set("n", "<space>hf", "<cmd>DiffviewFileHistory --follow %<cr>")
vim.keymap.set("n", "<space>hl", "<cmd>.DiffviewFileHistory --follow<cr>")
vim.keymap.set("v", "<space>hl", "<esc><cmd>'<,'>DiffviewFileHistory --follow<cr>")

-- Treesitter
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		local kind = event.data.kind
		local spec = event.data.spec

		if spec.name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			vim.cmd.TSUpdate()
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local filetype = args.match
		local lang = vim.treesitter.language.get_lang(filetype)
		if not vim.treesitter.language.add(lang or "") then
			return
		end

		vim.treesitter.start()
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

local function ts_select(lhs, rhs)
	local ts = require("nvim-treesitter-textobjects.select")
	vim.keymap.set({ "x", "o" }, "a" .. lhs, function()
		ts.select_textobject(rhs .. ".outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "i" .. lhs, function()
		ts.select_textobject(rhs .. ".inner", "textobjects")
	end)
end
ts_select("c", "@class")
ts_select("m", "@function")
ts_select("f", "@function")
ts_select("F", "@call")
ts_select("b", "@block")
ts_select("s", "@statement")
ts_select("a", "@parameter")

local function ts_move(lhs_start, lhs_end, rhs)
	local ts = require("nvim-treesitter-textobjects.move")
	vim.keymap.set({ "n", "x", "o" }, "]" .. lhs_start, function()
		ts.goto_next_start(rhs .. ".outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[" .. lhs_start, function()
		ts.goto_previous_start(rhs .. ".outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]" .. lhs_end, function()
		ts.goto_next_end(rhs .. ".outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[" .. lhs_end, function()
		ts.goto_previous_end(rhs .. ".outer", "textobjects")
	end)
end
ts_move("]", "[", "@class")
ts_move("m", "M", "@function")
ts_move("f", "F", "@function")
ts_move("b", "B", "@block")
ts_move("s", "S", "@statement")
ts_move("a", "a", "@parameter")

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
		local bufnr = event.buf
		local opts = { buffer = bufnr }

		vim.keymap.set("n", "gD", require("snacks").picker.lsp_declarations, opts)
		vim.keymap.set("n", "gd", require("snacks").picker.lsp_definitions, opts)
		vim.keymap.set("n", "gi", require("snacks").picker.lsp_implementations, opts)
		vim.keymap.set("n", "gy", require("snacks").picker.lsp_type_definitions, opts)
		vim.keymap.set("n", "gr", require("snacks").picker.lsp_references, opts)
		vim.keymap.set("n", "<space>s", require("snacks").picker.lsp_symbols, opts)
		vim.keymap.set("n", "<space>t", require("snacks").picker.lsp_workspace_symbols, opts)

		vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<cr>", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<s-cr>", function()
			vim.lsp.buf.code_action({ context = { only = { "source" } } })
		end, opts)
		vim.keymap.set("n", "<space>k", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opts)
		vim.keymap.set("n", "gqie", vim.lsp.buf.format, opts)

		local lsp_augroup = vim.api.nvim_create_augroup("lsp", { clear = false })
		vim.api.nvim_clear_autocmds({ group = lsp_augroup, buffer = bufnr })

		if client:supports_method("textDocument/documentHighlight") then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = lsp_augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.document_highlight()
				end,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = lsp_augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.clear_references()
				end,
			})
		end
	end,
})

vim.lsp.linked_editing_range.enable()
vim.lsp.on_type_formatting.enable()
