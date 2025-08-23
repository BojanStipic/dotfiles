---@diagnostic disable: missing-fields

-- Options
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
	"indent-heuristic",
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

vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.backup = false

-- Keymaps
vim.keymap.set({ "n", "v", "o" }, "<space>", "<nop>")
vim.keymap.set("n", "ZZ", "<nop>")
vim.keymap.set("i", "<c-j>", "<nop>")
vim.keymap.set("i", "<c-k>", "<nop>")

vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "<down>", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")
vim.keymap.set({ "n", "v" }, "<up>", "gk")
vim.keymap.set({ "n", "v" }, "<c-d>", "5gj")
vim.keymap.set({ "n", "v" }, "<c-u>", "5gk")
vim.keymap.set({ "n", "v" }, "<c-f>", "10gj")
vim.keymap.set({ "n", "v" }, "<c-b>", "10gk")

vim.keymap.set({ "n", "v" }, "\\", '"+')
vim.keymap.set({ "n", "v" }, "gp", '"0p=`]')
vim.keymap.set({ "n", "v" }, "gP", '"0P=`]')
vim.keymap.set({ "n", "v" }, "p", "p=`]")
vim.keymap.set({ "n", "v" }, "P", "P=`]")

vim.keymap.set("n", "<space>z", "<cmd>setlocal spell! spell?<cr>")
vim.keymap.set("n", "<space>/", "<cmd>set hlsearch! hlsearch?<cr>")

vim.keymap.set("o", "ie", "<cmd>normal! meggVG<cr>`e")
vim.keymap.set("o", "ae", "<cmd>normal! meggVG<cr>`e")

vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")

vim.keymap.set({ "n", "v" }, "<c-h>", "<c-w>h")
vim.keymap.set({ "n", "v" }, "<c-j>", "<c-w>j")
vim.keymap.set({ "n", "v" }, "<c-k>", "<c-w>k")
vim.keymap.set({ "n", "v" }, "<c-l>", "<c-w>l")

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

vim.keymap.set({ "n", "v" }, "<f1>", "gT")
vim.keymap.set({ "n", "v" }, "<f2>", "gt")
vim.keymap.set({ "n", "v" }, "<c-w>t", "<cmd>tab split<cr>")
vim.keymap.set({ "n", "v" }, "<f3>", "<cmd>tab split<cr>")
vim.keymap.set({ "n", "v" }, "<f4>", "<c-w>T")
vim.keymap.set("i", "<f1>", "<nop>")
vim.keymap.set("i", "<f2>", "<nop>")
vim.keymap.set("i", "<f3>", "<nop>")
vim.keymap.set("i", "<f4>", "<nop>")

vim.keymap.set("c", "%%", '<c-r>=fnameescape(expand("%:h")) .. "/"<cr>')
vim.keymap.set("n", "-", "<cmd>edit %:p:h<cr>")
vim.keymap.set("n", "_", "<cmd>edit .<cr>")
vim.keymap.set("n", "<space>f", function()
	vim.ui.open(vim.fn.expand("%:h"))
end)
vim.keymap.set("n", "<space>F", function()
	vim.ui.open(".")
end)

-- Diagnostics
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

-- File types
vim.filetype.add({
	extension = {
		mdx = "markdown.mdx",
	},
	filename = {
		["compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
	},
})

-- Auto commands
local init_augroup = vim.api.nvim_create_augroup("init.lua", {})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	desc = "Check if any buffers were changed outside of Neovim",
	group = init_augroup,
	command = "silent! checktime",
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	desc = "Resize all windows when Neovim is resized",
	group = init_augroup,
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Trim all trailing whitespace",
	group = init_augroup,
	callback = function()
		local cursor_position = vim.api.nvim_win_get_cursor(0)
		vim.cmd([[keeppatterns %s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, cursor_position)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Auto-create parent directories on :write",
	group = init_augroup,
	callback = function(opts)
		local dir = vim.fs.dirname(opts.match)
		if opts.match:find("://") == nil and vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Enable spell check on text files",
	group = init_augroup,
	pattern = { "text", "markdown", "asciidoc", "gitcommit" },
	command = "setlocal spell",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked region",
	group = init_augroup,
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	"mason-org/mason.nvim",

	"echasnovski/mini.icons",
	{ "catppuccin/nvim", name = "catppuccin" },
	"nvim-lualine/lualine.nvim",

	"stevearc/oil.nvim",
	{ "saghen/blink.cmp", version = "*" },
	"echasnovski/mini.pairs",
	"echasnovski/mini.splitjoin",
	"echasnovski/mini.surround",
	"folke/snacks.nvim",
	"folke/persistence.nvim",
	"tpope/vim-abolish",
	"tpope/vim-sleuth",

	"lewis6991/gitsigns.nvim",
	"sindrets/diffview.nvim",

	{ "nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },

	"neovim/nvim-lspconfig",
	"folke/lazydev.nvim",
	"mfussenegger/nvim-jdtls",

	"stevearc/conform.nvim",
})

require("mason").setup()

-- Icons
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()

-- Colorscheme
require("catppuccin").setup({
	integrations = {
		native_lsp = {
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
				ok = { "undercurl" },
			},
		},
	},
})
vim.cmd.colorscheme("catppuccin")

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

require("mini.pairs").setup()

require("mini.splitjoin").setup({
	mappings = {
		toggle = "<space>j",
	},
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
		matcher = {
			sort_empty = true,
			frecency = true,
		},
		formatters = {
			file = { truncate = 999 },
		},
		layout = {
			reverse = true,
			layout = {
				width = 0.8,
				height = 0.8,
				min_width = 120,
				box = "vertical",
				border = "rounded",
				title = "{title} {live} {flags}",
				{ win = "preview", height = 0.5, border = "bottom", title = "{preview}" },
				{ win = "list", border = "none" },
				{ win = "input", height = 1, border = "top" },
			},
		},
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

-- Git
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
})
vim.keymap.set("n", "<space>c", "<cmd>DiffviewOpen<cr>")
vim.keymap.set("n", "<space>hh", "<cmd>DiffviewFileHistory %<cr>")
vim.keymap.set("n", "<space>hl", "<cmd>DiffviewFileHistory<cr>")

-- Treesitter
require("nvim-treesitter").install({
	"astro",
	"bash",
	"css",
	"dockerfile",
	"fish",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"groovy",
	"html",
	"http",
	"hurl",
	"java",
	"javadoc",
	"javascript",
	"json",
	"just",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"python",
	"rust",
	"sql",
	"tmux",
	"toml",
	"tsx",
	"typesctipt",
	"xml",
	"yaml",
})

vim.api.nvim_create_autocmd("FileType", {
	group = init_augroup,
	callback = function(args)
		local filetype = args.match
		local lang = vim.treesitter.language.get_lang(filetype)
		if not vim.treesitter.language.add(lang or "") then
			return
		end

		vim.treesitter.start()
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		if not vim.tbl_contains({ "yaml" }, lang) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
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
	group = init_augroup,
	callback = function(event)
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
		local bufnr = event.buf
		local opts = { buffer = bufnr }

		vim.bo[bufnr].formatexpr = nil

		vim.keymap.set("n", "gD", require("snacks").picker.lsp_declarations, opts)
		vim.keymap.set("n", "gd", require("snacks").picker.lsp_definitions, opts)
		vim.keymap.set("n", "gi", require("snacks").picker.lsp_implementations, opts)
		vim.keymap.set("n", "gy", require("snacks").picker.lsp_type_definitions, opts)
		vim.keymap.set("n", "gr", require("snacks").picker.lsp_references, opts)
		vim.keymap.set("n", "<space>s", require("snacks").picker.lsp_symbols, opts)

		vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<cr>", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<s-cr>", function()
			vim.lsp.buf.code_action({ context = { only = { "source" } } })
		end, opts)
		vim.keymap.set("n", "<space>k", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opts)

		local lsp_augroup = vim.api.nvim_create_augroup("lsp", { clear = false })
		vim.api.nvim_clear_autocmds({ group = lsp_augroup, buffer = bufnr })

		if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
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

require("lazydev").setup()
vim.lsp.config("denols", {
	root_markers = { "deno.json", "deno.jsonc" },
	workspace_required = true,
})
vim.lsp.config("vtsls", {
	root_markers = { "package.json" },
	workspace_required = true,
})

vim.lsp.enable({
	"lua_ls",
	"bashls",
	"rust_analyzer",
	"pyright",

	"denols",
	"vtsls",
	"eslint",
	"html",
	"cssls",
	"tailwindcss",
	"astro",
	"mdx_analyzer",

	"dockerls",
	"docker_compose_language_service",
	"taplo",
	"jsonls",
	"yamlls",
	"lemminx",
	"gradle_ls",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		require("jdtls").start_or_attach({
			capabilities = require("blink.cmp").get_lsp_capabilities(),
			cmd = {
				"jdtls",
				"--jvm-arg=-javaagent:" .. vim.fn.expand("$MASON/share/jdtls/lombok.jar"),
				"--jvm-arg=-Xms4G",
				"--jvm-arg=-XX:+UseParallelGC",
			},
			settings = {
				java = {
					codeGeneration = {
						generateComments = false,
					},
				},
			},
		})
	end,
})

-- Formatting
require("conform").setup({
	default_format_opts = {
		lsp_format = "fallback",
		timeout_ms = 5000,
	},
	formatters_by_ft = {
		rust = { "rustfmt" },
		fish = { "fish_indent" },
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		astro = { "prettier" },
		markdown = { "prettier" },
		mdx = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		java = { "spotless_gradle", "spotless_maven" },
	},
})
vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.keymap.set("n", "gqie", require("conform").format)
vim.api.nvim_create_user_command("Format", function()
	require("conform").format()
end, {})
