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
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.diffopt:append({ "algorithm:patience", "indent-heuristic", "linematch:60", "vertical" })
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fileignorecase = true
vim.opt.wrapscan = false
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.completeopt = { "menuone", "noselect", "preview" }
vim.opt.modeline = false
vim.opt.showmode = false
vim.opt.number = true
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn = "yes:2"
vim.opt.colorcolumn = "81"
vim.opt.list = true
vim.opt.listchars = { tab = "│ ", trail = "·" }
vim.opt.timeoutlen = 2000
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 300
vim.opt.mousescroll = { "ver:1", "hor:1" }
vim.opt.shortmess:append({ A = true, c = true })
vim.opt.sessionoptions:remove({ "curdir" })
vim.opt.sessionoptions:append({ "sesdir" })

vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.backup = false

-- Keymaps
vim.keymap.set({ "n", "v", "o" }, "<space>", "<nop>")
vim.keymap.set("n", "ZZ", "<nop>")
vim.keymap.set("i", "<c-j>", "<nop>")
vim.keymap.set("i", "<c-k>", "<nop>")

vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")
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

vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

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

vim.keymap.set("n", "<space>q", "<cmd>source Session.vim<cr>")
vim.keymap.set("n", "<space>Q", "<cmd>Obsession<cr>")

-- Diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "●",
			[vim.diagnostic.severity.WARN] = "●",
			[vim.diagnostic.severity.INFO] = "●",
			[vim.diagnostic.severity.HINT] = "●",
		},
	},
})
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ wrap = false })
end)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ wrap = false })
end)

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
	group = init_augroup,
	command = "silent! checktime",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = init_augroup,
	command = "%s/\\s\\+$//e",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = init_augroup,
	callback = function(opts)
		local dir = vim.fn.fnamemodify(opts.match, ":h")
		if opts.match:find("://") == nil and vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = init_augroup,
	callback = function()
		local lead = "│"
		for _ = 1, vim.bo.tabstop - 1 do
			lead = lead .. " "
		end
		vim.opt_local.listchars:append({ leadmultispace = lead })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = init_augroup,
	pattern = "gitcommit",
	command = "setlocal spell",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = init_augroup,
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
	group = init_augroup,
	command = "set guicursor&",
})
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
	group = init_augroup,
	command = "set guicursor=a:ver25",
})

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
	"williamboman/mason.nvim",

	{ "catppuccin/nvim", name = "catppuccin" },
	{ "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

	{ "stevearc/oil.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	"kylechui/nvim-surround",
	"windwp/nvim-autopairs",
	"Wansmer/treesj",
	"tpope/vim-obsession",
	"tpope/vim-abolish",
	"tpope/vim-sleuth",

	"lewis6991/gitsigns.nvim",
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	"neovim/nvim-lspconfig",
	"folke/lazydev.nvim",
	"mfussenegger/nvim-jdtls",

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},

	"stevearc/conform.nvim",
})

require("mason").setup()

-- Colorscheme
require("catppuccin").setup({
	integrations = {
		native_lsp = {
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
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
		lualine_y = { "ObsessionStatus" },
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

-- Surround
require("nvim-surround").setup({
	keymaps = {
		normal = "s",
		normal_cur = "ss",
		visual = "s",
		delete = "ds",
		change = "cs",
	},
})

-- Autopairs
require("nvim-autopairs").setup({})

-- Split-join
require("treesj").setup({ use_default_keymaps = false })
vim.keymap.set("n", "<space>j", require("treesj").toggle)

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
		vim.keymap.set("n", "<space>hu", require("gitsigns").undo_stage_hunk, opts)

		vim.keymap.set("n", "<space>hp", require("gitsigns").preview_hunk, opts)
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

-- Fuzzy finder
require("telescope").setup({
	defaults = {
		wrap_results = true,
		layout_strategy = "vertical",
		layout_config = { preview_cutoff = 0 },
		mappings = {
			i = {
				["<c-s>"] = require("telescope.actions").select_horizontal,
			},
			n = {
				["<c-s>"] = require("telescope.actions").select_horizontal,
			},
		},
	},

	pickers = {
		lsp_references = { show_line = false },
		lsp_incoming_calls = { show_line = false },
		lsp_outgoing_calls = { show_line = false },
		lsp_definitions = { show_line = false },
		lsp_type_definitions = { show_line = false },
		lsp_implementations = { show_line = false },
		lsp_document_symbols = { show_line = false },
		lsp_workspace_symbols = { show_line = false },
		lsp_dynamic_workspace_symbols = { show_line = false },
	},

	extensions = {
		["ui-select"] = { require("telescope.themes").get_ivy() },
	},
})
require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzf")

vim.keymap.set("n", "<space><space>", require("telescope.builtin").resume)
vim.keymap.set("n", "<space>p", require("telescope.builtin").find_files)
vim.keymap.set("n", "<space>g", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<space>d", require("telescope.builtin").diagnostics)
vim.keymap.set("n", "<space>b", function()
	require("telescope.builtin").buffers({ sort_mru = true })
end)

-- Treesitter
require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["am"] = "@function.outer",
				["im"] = "@function.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
			},
		},

		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]]"] = "@class.outer",
				["]f"] = "@function.outer",
				["]m"] = "@function.outer",
				["]a"] = "@parameter.inner",
			},
			goto_next_end = {
				["]["] = "@class.outer",
				["]F"] = "@function.outer",
				["]M"] = "@function.outer",
				["]A"] = "@parameter.inner",
			},
			goto_previous_start = {
				["[["] = "@class.outer",
				["[f"] = "@function.outer",
				["[m"] = "@function.outer",
				["[a"] = "@parameter.inner",
			},
			goto_previous_end = {
				["[]"] = "@class.outer",
				["[F"] = "@function.outer",
				["[M"] = "@function.outer",
				["[A"] = "@parameter.inner",
			},
		},
	},
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = init_augroup,
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local bufnr = event.buf
		local opts = { buffer = bufnr }

		vim.bo[bufnr].formatexpr = nil

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
		vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
		vim.keymap.set("n", "gy", require("telescope.builtin").lsp_type_definitions, opts)
		vim.keymap.set("n", "gr", function()
			require("telescope.builtin").lsp_references({ include_declaration = false })
		end, opts)
		vim.keymap.set("n", "gR", require("telescope.builtin").lsp_references, opts)
		vim.keymap.set("n", "gci", require("telescope.builtin").lsp_incoming_calls, opts)
		vim.keymap.set("n", "gco", require("telescope.builtin").lsp_outgoing_calls, opts)

		vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<cr>", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<s-cr>", function()
			vim.lsp.buf.code_action({ context = { only = { "source" } } })
		end, opts)
		vim.keymap.set("n", "<space>k", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opts)
		vim.keymap.set("n", "<space>s", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)

		local lsp_augroup = vim.api.nvim_create_augroup("lsp", { clear = false })
		vim.api.nvim_clear_autocmds({ group = lsp_augroup, buffer = bufnr })

		if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
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

local lsp_opts = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

require("lspconfig").rust_analyzer.setup(lsp_opts)
require("lspconfig").clangd.setup(lsp_opts)
require("lspconfig").pyright.setup(lsp_opts)
require("lspconfig").bashls.setup(lsp_opts)
require("lspconfig").dockerls.setup(lsp_opts)
require("lspconfig").docker_compose_language_service.setup(lsp_opts)

require("lspconfig").tsserver.setup(lsp_opts)
require("lspconfig").eslint.setup(lsp_opts)
require("lspconfig").html.setup(lsp_opts)
require("lspconfig").cssls.setup(lsp_opts)
require("lspconfig").tailwindcss.setup(lsp_opts)
require("lspconfig").astro.setup(lsp_opts)
require("lspconfig").mdx_analyzer.setup(lsp_opts)

require("lspconfig").taplo.setup(lsp_opts)
require("lspconfig").jsonls.setup(lsp_opts)
require("lspconfig").yamlls.setup(lsp_opts)
require("lspconfig").lemminx.setup(lsp_opts)

require("lazydev").setup()
require("lspconfig").lua_ls.setup(lsp_opts)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		require("jdtls").start_or_attach(vim.tbl_extend("force", lsp_opts, {
			cmd = {
				"jdtls",
				"--jvm-arg=-javaagent:" .. vim.fn.expand("$MASON/share/jdtls/lombok.jar"),
			},
			settings = {
				java = {
					codeGeneration = {
						generateComments = false,
					},
				},
			},
		}))
	end,
})
require("lspconfig").gradle_ls.setup(lsp_opts)

-- Autocomplete
require("cmp").setup({
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},

	mapping = require("cmp").mapping.preset.insert({
		["<c-space>"] = require("cmp").mapping.complete({}),
		["<c-j>"] = require("cmp").mapping(function()
			vim.snippet.jump(1)
		end, { "i", "s" }),
		["<c-k>"] = require("cmp").mapping(function()
			vim.snippet.jump(-1)
		end, { "i", "s" }),
		["<c-e>"] = require("cmp").mapping.scroll_docs(1),
		["<c-y>"] = require("cmp").mapping.scroll_docs(-1),
		["<c-d>"] = require("cmp").mapping.scroll_docs(2),
		["<c-u>"] = require("cmp").mapping.scroll_docs(-2),
		["<c-f>"] = require("cmp").mapping.scroll_docs(4),
		["<c-b>"] = require("cmp").mapping.scroll_docs(-4),
		["<cr>"] = require("cmp").mapping.confirm(),
	}),

	sources = require("cmp").config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}),
})

require("cmp").setup.cmdline({ "/", "?" }, {
	mapping = require("cmp").mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

require("cmp").setup.cmdline(":", {
	mapping = require("cmp").mapping.preset.cmdline(),
	sources = require("cmp").config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Formatting
require("conform").setup({
	default_format_opts = {
		lsp_format = "fallback",
		timeout_ms = 2000,
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
	},
})
vim.opt.formatexpr = "v:lua.require('conform').formatexpr()"
vim.keymap.set("n", "gqie", require("conform").format)
