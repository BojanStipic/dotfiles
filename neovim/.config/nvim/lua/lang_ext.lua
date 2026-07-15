vim.filetype.add({
	extension = {
		mdx = "markdown.mdx",
	},
	filename = {
		["compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
	},
})

require("nvim-treesitter").install({
	"astro",
	"bash",
	"css",
	"diff",
	"dockerfile",
	"fish",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
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
	"typescript",
	"xml",
	"yaml",
})

require("mason").setup()
require("mason-registry").refresh(function()
	for _, package_name in ipairs({
		"lua-language-server",
		"stylua",
		"bash-language-server",
		"fish-lsp",
		"rust-analyzer",
		"gopls",
		"jdtls",
		"ty",

		"tsgo",
		"eslint-lsp",
		"oxlint",
		"oxfmt",
		"html-lsp",
		"css-lsp",
		"tailwindcss-language-server",
		"astro-language-server",
		"mdx-analyzer",

		"dockerfile-language-server",
		"docker-compose-language-service",
		"taplo",
		"json-lsp",
		"yaml-language-server",
		"lemminx",
		"gradle-language-server",
	}) do
		local package = require("mason-registry").get_package(package_name)
		if not package:is_installed() then
			package:install()
		end
	end
end)

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
				},
			},
		},
	},
})

vim.lsp.config("jdtls", {
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

vim.lsp.config("oxfmt", {
	workspace_required = false,
})

vim.lsp.enable({
	"lua_ls",
	"stylua",
	"bashls",
	"fish_lsp",
	"rust_analyzer",
	"gopls",
	"jdtls",
	"ty",

	"denols",
	"tsgo",
	"eslint",
	"oxlint",
	"oxfmt",
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
