local lsp = require('lsp-zero').preset("recommended")


lsp.setup_servers({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'gopls',
})



lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }



    require "lsp_signature".on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "rounded"
        }
    }, bufnr)

    --   local opts = {buffer = bufnr, remap = false}
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    -- lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
end)

-- -- (Optional) Configure lua language server for neovim

-- format on save
lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        -- if you have a working setup with null-ls
        -- you can specify filetypes it can format.
        -- ['null-ls'] = {'javascript', 'typescript'},
    }
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")

local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Insert }

local select_next_mapping = cmp.mapping(function()
    if cmp.visible() then
        cmp.select_next_item(cmp_select_opts)
    else
        cmp.complete()
    end
end)

cmp.setup({
    enabled = true,
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noselect',
    },
    sources = {
        { name = 'emmet_vim' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        -- { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<Up>'] = cmp.mapping.scroll_docs(-4),
        ['<C-,>'] = cmp.mapping.scroll_docs(-4),
        ['<Down>'] = cmp.mapping.scroll_docs(4),
        ['<C-.>'] = cmp.mapping.scroll_docs(4),
        ['<C-k>'] = select_next_mapping,
        ['<C-n>'] = select_next_mapping,
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = {
            scrollbar = true,
            max_height = 2000,
            max_width = 60,

        },
        documentation = {
            scrollbar = true,
            max_height = 2000,
            max_width = 60,
        }
    },
    formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
            local short_name = {
                nvim_lsp = 'LSP',
                nvim_lua = 'nvim'
            }

            local menu_name = short_name[entry.source.name] or entry.source.name

            item.menu = string.format('[%s]', menu_name)
            return item
        end,
    },
})
local ls = require("luasnip");
vim.keymap.set({ "i" }, "<Tab>", function() ls.expand() end, { silent = true, remap = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function()
    print("hi 2");
    ls.jump(1)
end, { remap = true })
vim.keymap.set({ "i", "s" }, "<C-h>", function()
    print("hi 1");
    ls.jump(-1);
end, { remap = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { remap = true })
