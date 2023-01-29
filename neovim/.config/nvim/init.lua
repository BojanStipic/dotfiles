-- Options
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0

vim.opt.spelllang = { 'en', 'sr@latin' }
vim.opt.scrolloff = 10
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldlevelstart = 99
vim.opt.diffopt:append({ 'algorithm:patience', 'indent-heuristic', 'vertical' })
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fileignorecase = true
vim.opt.wrapscan = false
vim.opt.wildmode = { 'longest:full', 'full' }
vim.opt.completeopt = { 'menuone', 'noselect', 'preview' }
vim.opt.modeline = false
vim.opt.showmode = false
vim.opt.number = true
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.signcolumn = 'yes:2'
vim.opt.colorcolumn = '81'
vim.opt.list = true
vim.opt.listchars = { tab = '¦ ', trail = '·' }
vim.opt.timeoutlen = 2000
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 300
vim.opt.mousescroll = { 'ver:1', 'hor:1' }
vim.opt.shortmess:append({ A = true })
vim.opt.sessionoptions:remove({ 'curdir' })
vim.opt.sessionoptions:append({ 'sesdir' })

vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.backup = false

-- Keymaps
vim.keymap.set({ 'n', 'v', 'o' }, '<space>', '<nop>')
vim.keymap.set('n', 'ZZ', '<nop>')
vim.keymap.set('i', '<c-j>', '<nop>')
vim.keymap.set('i', '<c-k>', '<nop>')

vim.keymap.set({ 'n', 'v' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v' }, 'k', 'gk')
vim.keymap.set({ 'n', 'v' }, '<c-d>', '5gj')
vim.keymap.set({ 'n', 'v' }, '<c-u>', '5gk')
vim.keymap.set({ 'n', 'v' }, '<c-f>', '10gj')
vim.keymap.set({ 'n', 'v' }, '<c-b>', '10gk')
vim.keymap.set({ 'n', 'v' }, 'gw', '*')

vim.keymap.set({ 'n', 'v' }, '\\', '"+')
vim.keymap.set({ 'n', 'v' }, 'gp', '"0p=`]')
vim.keymap.set({ 'n', 'v' }, 'gP', '"0P=`]')
vim.keymap.set({ 'n', 'v' }, 'p', 'p=`]')
vim.keymap.set({ 'n', 'v' }, 'P', 'P=`]')

vim.keymap.set('n', '<space>z', '<cmd>setlocal spell! spell?<cr>')
vim.keymap.set('n', '<space>/', '<cmd>set hlsearch! hlsearch?<cr>')

vim.keymap.set('i', '(<cr>', '(<cr>)<esc>O')
vim.keymap.set('i', '(;', '(<cr>);<esc>O')
vim.keymap.set('i', '(,', '(<cr>),<esc>O')
vim.keymap.set('i', '[<cr>', '[<cr>]<esc>O')
vim.keymap.set('i', '[;', '[<cr>];<esc>O')
vim.keymap.set('i', '[,', '[<cr>],<esc>O')
vim.keymap.set('i', '{<cr>', '{<cr>}<esc>O')
vim.keymap.set('i', '{;', '{<cr>};<esc>O')
vim.keymap.set('i', '{,', '{<cr>},<esc>O')

vim.keymap.set('o', 'ie', '<cmd>normal! meggVG<cr>`e')
vim.keymap.set('o', 'ae', '<cmd>normal! meggVG<cr>`e')

vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', '$')

vim.keymap.set({ 'n', 'v' }, '<c-h>', '<c-w>h')
vim.keymap.set({ 'n', 'v' }, '<c-j>', '<c-w>j')
vim.keymap.set({ 'n', 'v' }, '<c-k>', '<c-w>k')
vim.keymap.set({ 'n', 'v' }, '<c-l>', '<c-w>l')

vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

vim.keymap.set({ 'n', 'v' }, '<f1>', 'gT')
vim.keymap.set({ 'n', 'v' }, '<f2>', 'gt')
vim.keymap.set({ 'n', 'v' }, '<c-w>t', '<cmd>tab split<cr>')
vim.keymap.set({ 'n', 'v' }, '<f3>', '<cmd>tab split<cr>')
vim.keymap.set({ 'n', 'v' }, '<f4>', '<c-w>T')
vim.keymap.set('i', '<f1>', '<nop>')
vim.keymap.set('i', '<f2>', '<nop>')
vim.keymap.set('i', '<f3>', '<nop>')
vim.keymap.set('i', '<f4>', '<nop>')

vim.keymap.set('c', '%%', '<c-r>=fnameescape(expand("%:h")) .. "/"<cr>')
vim.keymap.set('n', '-', '<cmd>edit %:p:h<cr>')
vim.keymap.set('n', '_', '<cmd>edit .<cr>')
vim.keymap.set('n', '<space>f', '<cmd>silent !xdg-open %:p:h<cr>')
vim.keymap.set('n', '<space>F', '<cmd>silent !xdg-open .<cr>')

vim.keymap.set('n', '<space>q', '<cmd>source Session.vim<cr>')
vim.keymap.set('n', '<space>Q', '<cmd>Obsession<cr>')

-- Diagnostics
vim.diagnostic.config({ virtual_text = false })
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ wrap = false }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ wrap = false }) end)
vim.fn.sign_define('DiagnosticSignError', { text = '●', texthl = 'DiagnosticSignError', numhl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '●', texthl = 'DiagnosticSignWarn', numhl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '●', texthl = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '●', texthl = 'DiagnosticSignHint', numhl = 'DiagnosticSignHint' })

-- Auto commands
local init_augroup = vim.api.nvim_create_augroup('init.lua', {})

vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = init_augroup,
    command = 'silent! checktime',
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = init_augroup,
    command = '%s/\\s\\+$//e',
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = init_augroup,
    callback = function(opts)
        local dir = vim.fn.fnamemodify(opts.match, ':h')
        if opts.match:find('://') == nil and vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = init_augroup,
    pattern = 'gitcommit',
    command = 'setlocal spell',
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = init_augroup,
    callback = function() vim.highlight.on_yank({ timeout = 300 }) end,
})

vim.api.nvim_create_autocmd({ 'VimEnter', 'VimResume' }, {
    group = init_augroup,
    command = 'set guicursor&',
})
vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
    group = init_augroup,
    command = 'set guicursor=a:ver25',
})

-- Plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
    'williamboman/mason.nvim',

    { 'catppuccin/nvim', name = 'catppuccin' },
    { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    'stevearc/dressing.nvim',

    { 'stevearc/oil.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    'kylechui/nvim-surround',
    'tpope/vim-obsession',
    'tpope/vim-abolish',
    'tpope/vim-sleuth',

    'lewis6991/gitsigns.nvim',
    {
        'sindrets/diffview.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
    },

    'neovim/nvim-lspconfig',
    'folke/neodev.nvim',
    'mfussenegger/nvim-jdtls',

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
    },

    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'haydenmeade/neotest-jest',
        },
    },
})

require('mason').setup()

-- Colorscheme
require('catppuccin').setup({
    integrations = {
        native_lsp = {
            underlines = {
                errors = { 'undercurl' },
                hints = { 'undercurl' },
                warnings = { 'undercurl' },
                information = { 'undercurl' },
            },
        },
    },
})

vim.cmd.colorscheme('catppuccin')

-- Statusline
require('lualine').setup({
    options = {
        component_separators = '',
        section_separators = '',
    },
    sections = {
        lualine_x = {
            function()
                if vim.lsp.buf.server_ready() then return 'LSP' else return '' end
            end,
        },
        lualine_y = { 'filetype' },
        lualine_z = { 'ObsessionStatus', 'progress', 'location' },
    },
    tabline = {
        lualine_a = {
            { 'tabs', max_length = vim.o.columns, mode = 2 },
        },
    },
})

-- UI
require('dressing').setup({
    select = {
        telescope = require('telescope.themes').get_ivy(),
    },
})

-- File browser
require('oil').setup({
    win_options = {
        conceallevel = 0,
    },
    view_options = {
        show_hidden = true,
    },
})

-- Surround
require('nvim-surround').setup({
    keymaps = {
        normal = 's',
        normal_cur = 'ss',
        visual = 's',
        delete = 'ds',
        change = 'cs',
    },
})

-- Git signs
require('gitsigns').setup({
    signs = {
        untracked = {text = '┃'},
    },
    on_attach = function(bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set('n', ']c', function()
            if vim.wo.diff then return ']c' end

            vim.schedule(function() require('gitsigns').next_hunk() end)
            return '<ignore>'
        end, { buffer = bufnr, expr = true })

        vim.keymap.set('n', '[c', function()
            if vim.wo.diff then return '[c' end

            vim.schedule(function() require('gitsigns').prev_hunk() end)
            return '<ignore>'
        end, { buffer = bufnr, expr = true })

        vim.keymap.set({ 'n', 'v' }, '<space>hs', require('gitsigns').stage_hunk, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>hr', require('gitsigns').reset_hunk, opts)
        vim.keymap.set('n', '<space>hS', require('gitsigns').stage_buffer, opts)
        vim.keymap.set('n', '<space>hR', require('gitsigns').reset_buffer, opts)
        vim.keymap.set('n', '<space>hu', require('gitsigns').undo_stage_hunk, opts)

        vim.keymap.set('n', '<space>hp', require('gitsigns').preview_hunk, opts)
        vim.keymap.set('n', '<space>hb', function()
            require('gitsigns').blame_line({ full = true })
        end, opts)
    end,
})

require('diffview').setup({
    view = {
        merge_tool = {
            layout = 'diff1_plain',
        },
    },
    file_panel = {
        listing_style = 'list',
    },
})
vim.keymap.set('n', '<space>c', '<cmd>DiffviewOpen<cr>')
vim.keymap.set('n', '<space>hh', '<cmd>DiffviewFileHistory %<cr>')
vim.keymap.set('n', '<space>hl', '<cmd>DiffviewFileHistory<cr>')

-- Fuzzy finder
require('telescope').setup({
    defaults = {
        wrap_results = true,
        layout_strategy = 'vertical',
        layout_config = { preview_cutoff = 0 },
        mappings = {
            i = {
                ['<c-s>'] = require('telescope.actions').select_horizontal,
            },
            n = {
                ['<c-s>'] = require('telescope.actions').select_horizontal,
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
})
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<space>p', require('telescope.builtin').find_files)
vim.keymap.set('n', '<space>g', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<space>d', require('telescope.builtin').diagnostics)
vim.keymap.set('n', '<space><space>', function()
    require('telescope.builtin').buffers({ sort_mru = true })
end)

-- Treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'rust',
        'toml',
        'typescript',
        'tsx',
        'javascript',
        'html',
        'css',
        'json',
        'yaml',
        'java',
        'bash',
        'lua',
        'c',
        'cpp',
        'make',
        'ninja',
        'dockerfile',
        'markdown',
        'markdown_inline',
    },
    sync_install = false,

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
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['am'] = '@function.outer',
                ['im'] = '@function.inner',
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['ab'] = '@block.outer',
                ['ib'] = '@block.inner',
            },
        },

        swap = {
            enable = true,
            swap_next = {
                ['sfl'] = '@function.outer',
                ['sml'] = '@function.outer',
                ['sal'] = '@parameter.inner',
            },
            swap_previous = {
                ['sfh'] = '@function.outer',
                ['smh'] = '@function.outer',
                ['sah'] = '@parameter.inner',
            },
        },

        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']]'] = '@class.outer',
                [']f'] = '@function.outer',
                [']m'] = '@function.outer',
                [']a'] = '@parameter.inner',
            },
            goto_next_end = {
                [']['] = '@class.outer',
                [']F'] = '@function.outer',
                [']M'] = '@function.outer',
                [']A'] = '@parameter.inner',
            },
            goto_previous_start = {
                ['[['] = '@class.outer',
                ['[f'] = '@function.outer',
                ['[m'] = '@function.outer',
                ['[a'] = '@parameter.inner',
            },
            goto_previous_end = {
                ['[]'] = '@class.outer',
                ['[F'] = '@function.outer',
                ['[M'] = '@function.outer',
                ['[A'] = '@parameter.inner',
            },
        },
    },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- LSP
local lsp_on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, opts)
    vim.keymap.set('n', 'gy', require('telescope.builtin').lsp_type_definitions, opts)
    vim.keymap.set('n', 'gr', function()
        require('telescope.builtin').lsp_references({ include_declaration = false })
    end, opts)
    vim.keymap.set('n', 'gR', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'gci', require('telescope.builtin').lsp_incoming_calls, opts)
    vim.keymap.set('n', 'gco', require('telescope.builtin').lsp_outgoing_calls, opts)

    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<cr>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>s', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)
    vim.keymap.set('n', 'gqie', vim.lsp.buf.format, opts)

    if client.server_capabilities.documentHighlightProvider then
        local lsp_augroup = vim.api.nvim_create_augroup('lsp', { clear = false })
        vim.api.nvim_clear_autocmds({ group = lsp_augroup, buffer = bufnr })

        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = lsp_augroup,
            buffer = bufnr,
            callback = function() vim.lsp.buf.document_highlight() end,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = lsp_augroup,
            buffer = bufnr,
            callback = function() vim.lsp.buf.clear_references() end,
        })
    end
end

local lsp_opts = {
    on_attach = lsp_on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

require('lspconfig').rust_analyzer.setup(lsp_opts)
require('lspconfig').taplo.setup(lsp_opts)
require('lspconfig').clangd.setup(lsp_opts)
require('lspconfig').bashls.setup(lsp_opts)

require('lspconfig').tsserver.setup(lsp_opts)
require('lspconfig').eslint.setup(lsp_opts)
require('lspconfig').html.setup(lsp_opts)
require('lspconfig').cssls.setup(lsp_opts)
require('lspconfig').jsonls.setup(lsp_opts)

require('neodev').setup({
    override = function(root_dir, options)
        if root_dir:match('dotfiles') then
            options.enabled = true
            options.plugins = true
        end
    end,
})
require('lspconfig').sumneko_lua.setup(vim.tbl_extend('force', lsp_opts, {
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}))

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    callback = function()
        require('jdtls').start_or_attach(vim.tbl_extend('force', lsp_opts, {
            cmd = {
                'jdtls',
                '-configuration',
                vim.fn.expand('~/.cache/jdtls'),
                '--jvm-arg=-javaagent:'
                    .. require('mason-registry').get_package('jdtls'):get_install_path()
                    .. '/lombok.jar',
            },
        }))
    end,
})

-- Autocomplete
require('cmp').setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = require('cmp').mapping.preset.insert({
        ['<c-space>'] = require('cmp').mapping.complete({}),
        ['<c-j>'] = require('cmp').mapping(function()
            require('luasnip').jump(1)
        end, { 'i', 's' }),
        ['<c-k>'] = require('cmp').mapping(function()
            require('luasnip').jump(-1)
        end, { 'i', 's' }),
        ['<c-e>'] = require('cmp').mapping.scroll_docs(1),
        ['<c-y>'] = require('cmp').mapping.scroll_docs(-1),
        ['<c-d>'] = require('cmp').mapping.scroll_docs(2),
        ['<c-u>'] = require('cmp').mapping.scroll_docs(-2),
        ['<c-f>'] = require('cmp').mapping.scroll_docs(4),
        ['<c-b>'] = require('cmp').mapping.scroll_docs(-4),
        ['<cr>'] = require('cmp').mapping.confirm(),
    }),

    sources = require('cmp').config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    }),
})

require('cmp').setup.cmdline({ '/', '?' }, {
    mapping = require('cmp').mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

require('cmp').setup.cmdline(':', {
    mapping = require('cmp').mapping.preset.cmdline(),
    sources = require('cmp').config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})

-- Test runner
require('neotest').setup({
    adapters = {
        require('neotest-jest')({
            jestCommand = 'npm test --',
            env = { CI = true },
        }),
    },
})

vim.keymap.set('n', '<space>t', require('neotest').run.run)
vim.keymap.set('n', '<space>T', function() require('neotest').run.run(vim.fn.expand('%')) end)
