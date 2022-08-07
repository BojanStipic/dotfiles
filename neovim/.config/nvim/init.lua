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
vim.opt.mouse = 'a'
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

vim.keymap.set({ 'n', 'v' }, 'j', 'gj', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'k', 'gk', { silent = true })

vim.keymap.set({ 'n', 'v' }, '\\', '"+')
vim.keymap.set({ 'n', 'v' }, 'gp', '"0p=`]')
vim.keymap.set({ 'n', 'v' }, 'gP', '"0P=`]')
vim.keymap.set({ 'n', 'v' }, 'p', 'p=`]')
vim.keymap.set({ 'n', 'v' }, 'P', 'P=`]')

vim.keymap.set('n', '<space>z', ':set spell! spell?<cr>')
vim.keymap.set('n', '<space>/', ':set hlsearch! hlsearch?<cr>')

vim.keymap.set('i', '(<cr>', '(<cr>)<esc>O')
vim.keymap.set('i', '(;', '(<cr>);<esc>O')
vim.keymap.set('i', '(,', '(<cr>),<esc>O')
vim.keymap.set('i', '[<cr>', '[<cr>]<esc>O')
vim.keymap.set('i', '[;', '[<cr>];<esc>O')
vim.keymap.set('i', '[,', '[<cr>],<esc>O')
vim.keymap.set('i', '{<cr>', '{<cr>}<esc>O')
vim.keymap.set('i', '{;', '{<cr>};<esc>O')
vim.keymap.set('i', '{,', '{<cr>},<esc>O')

vim.keymap.set('o', 'ie', ':<c-u>normal! meggVG<cr>`e')
vim.keymap.set('o', 'ae', ':<c-u>normal! meggVG<cr>`e')

vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', '$')

vim.keymap.set({ 'n', 'v' }, '<c-h>', '<c-w>h')
vim.keymap.set({ 'n', 'v' }, '<c-j>', '<c-w>j')
vim.keymap.set({ 'n', 'v' }, '<c-k>', '<c-w>k')
vim.keymap.set({ 'n', 'v' }, '<c-l>', '<c-w>l')

vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

vim.keymap.set({ 'n', 'v' }, '<f1>', 'gT')
vim.keymap.set({ 'n', 'v' }, '<f2>', 'gt')
vim.keymap.set({ 'n', 'v' }, '<c-w>t', ':tab split<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<f3>', ':tab split<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<f4>', '<c-w>T')
vim.keymap.set('i', '<f1>', '<nop>')
vim.keymap.set('i', '<f2>', '<nop>')
vim.keymap.set('i', '<f3>', '<nop>')
vim.keymap.set('i', '<f4>', '<nop>')

vim.keymap.set('c', '%%', '<c-r>=fnameescape(expand("%:h")) .. "/"<cr>')
vim.keymap.set('n', '-', ':silent edit %:p:h<cr>', { silent = true })
vim.keymap.set('n', '<space>f', ':silent !xdg-open %:p:h<cr>', { silent = true })
vim.keymap.set('n', '<space>F', ':silent !xdg-open .<cr>', { silent = true })

vim.keymap.set('n', '<space>q', ':source Session.vim<cr>', { silent = true })
vim.keymap.set('n', '<space>Q', ':Obsession<cr>', { silent = true })

-- Diagnostics
vim.diagnostic.config({ virtual_text = false })
vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev({ wrap = false }) end)
vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next({ wrap = false }) end)
vim.fn.sign_define('DiagnosticSignError', { text = '●', texthl = 'DiagnosticSignError', numhl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '●', texthl = 'DiagnosticSignWarn', numhl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '●', texthl = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '●', texthl = 'DiagnosticSignHint', numhl = 'DiagnosticSignHint' })

-- Auto commands
local init_augroup = vim.api.nvim_create_augroup('init.lua', {})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = init_augroup,
    pattern = '*',
    command = '%s/\\s\\+$//e'
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = init_augroup,
    pattern = '*',
    callback = function()
        local dir = vim.fn.expand('<afile>:p:h')

        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end
})

vim.api.nvim_create_autocmd('FileType', {
    group = init_augroup,
    pattern = 'gitcommit',
    command = 'setlocal spell'
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = init_augroup,
    pattern = '*',
    callback = function() vim.highlight.on_yank({ timeout = 300 }) end
})

vim.api.nvim_create_autocmd({ 'VimEnter', 'VimResume' }, {
    group = init_augroup,
    pattern = '*',
    command = 'set guicursor&'
})
vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
    group = init_augroup,
    pattern = '*',
    command = 'set guicursor=a:ver25'
})

-- Plugins
local packer_location = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_location)) > 0 then
    vim.fn.system({
        'git', 'clone',
        '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        packer_location
    })
    vim.cmd([[packadd packer.nvim]])
    vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command = 'PackerSync' })
    vim.api.nvim_create_autocmd('User', { pattern = 'PackerComplete', command = 'source $MYVIMRC' })
end

require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('williamboman/mason.nvim')

    use('navarasu/onedark.nvim')
    use('nvim-lualine/lualine.nvim')
    use('kylechui/nvim-surround')
    use('elihunter173/dirbuf.nvim')
    use({ 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' })
    use('stevearc/dressing.nvim')

    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    })

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-textobjects')

    use('neovim/nvim-lspconfig')
    use('mfussenegger/nvim-jdtls')

    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
    })

    use('tpope/vim-obsession')
    use('tpope/vim-eunuch')
    use('tpope/vim-abolish')
    use('tpope/vim-sleuth')
end)

require('mason').setup()

-- Colorscheme
require('onedark').setup({
    code_style = {
        comments = 'italic',
        keywords = 'italic',
    },
})
require('onedark').load()

-- Statusline
require('lualine').setup({
    options = {
        icons_enabled = false,
        component_separators = '',
        section_separators = '',
    },
    sections = {
        lualine_x = {},
        lualine_y = { 'filetype' },
        lualine_z = { 'ObsessionStatus', 'progress', 'location' },
    },
    tabline = {
        lualine_a = {
            { 'tabs', max_length = vim.o.columns, mode = 2 },
        },
    }
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

-- File browser
require('dirbuf').setup({
    sort_order = 'directories_first',
})

-- Git signs
require('gitsigns').setup({
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
            require('gitsigns').blame_line { full = true }
        end, opts)
        vim.keymap.set('n', '<space>hd', require('gitsigns').diffthis, opts)
    end
})

-- UI
require('dressing').setup({
    select = {
        telescope = require('telescope.themes').get_ivy()
    },
})

-- Fuzzy finder
require('telescope').setup({
    defaults = {
        wrap_results = true,
        layout_strategy = 'vertical',
        layout_config = { preview_cutoff = 0 },
        mappings = {
            i = {
                ['<c-s>'] = require('telescope.actions').select_horizontal
            },
            n = {
                ['<c-s>'] = require('telescope.actions').select_horizontal
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
vim.keymap.set('n', '<space>e', require('telescope.builtin').diagnostics)
vim.keymap.set('n', '<space>c', require('telescope.builtin').git_status)
vim.keymap.set('n', '<space>hh', require('telescope.builtin').git_bcommits)
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
    vim.keymap.set('n', '<cr>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>s', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)

    vim.keymap.set('n', 'gqie', vim.lsp.buf.formatting, opts)
    vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

    if client.resolved_capabilities.document_highlight then
        local lsp_augroup = vim.api.nvim_create_augroup('lsp', { clear = false })
        vim.api.nvim_clear_autocmds({ group = lsp_augroup, buffer = bufnr })

        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = lsp_augroup,
            buffer = bufnr,
            callback = function() vim.lsp.buf.document_highlight() end
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = lsp_augroup,
            buffer = bufnr,
            callback = function() vim.lsp.buf.clear_references() end
        })
    end
end

local lsp_opts = {
    on_attach = lsp_on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
}

require('lspconfig').rust_analyzer.setup(lsp_opts)
require('lspconfig').clangd.setup(lsp_opts)
require('lspconfig').bashls.setup(lsp_opts)

require('lspconfig').tsserver.setup(lsp_opts)
require('lspconfig').html.setup(lsp_opts)
require('lspconfig').cssls.setup(lsp_opts)
require('lspconfig').jsonls.setup(lsp_opts)

require('lspconfig').sumneko_lua.setup(vim.tbl_extend('force', lsp_opts, {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
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
                vim.fn.expand('~/.cache/jdtls/config'),
                '-data',
                vim.fn.expand('~/.cache/jdtls/workspace'),
                '--jvm-arg=-javaagent:' .. vim.fn.stdpath('data') .. '/mason/packages/jdtls/lombok.jar'
            },
        }))
    end
})

-- Autocomplete
require('cmp').setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<c-space>'] = require('cmp').mapping.complete(),
        ['<c-n>'] = require('cmp').mapping.select_next_item(),
        ['<c-p>'] = require('cmp').mapping.select_prev_item(),
        ['<c-j>'] = require('cmp').mapping(function()
            require('luasnip').jump(1)
        end, { 'i', 's' }),
        ['<c-k>'] = require('cmp').mapping(function()
            require('luasnip').jump(-1)
        end, { 'i', 's' }),
        ['<c-e>'] = require('cmp').mapping.scroll_docs(1),
        ['<c-y>'] = require('cmp').mapping.scroll_docs(-1),
        ['<c-f>'] = require('cmp').mapping.scroll_docs(4),
        ['<c-b>'] = require('cmp').mapping.scroll_docs(-4),
        ['<cr>'] = require('cmp').mapping.confirm(),
    },

    sources = require('cmp').config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    }),
})

require('cmp').setup.cmdline('/', {
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
