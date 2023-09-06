local lsp = require('lsp-zero').preset("recommended")


print("LSP");
lsp.setup_servers({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer'
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
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set("n", "<leader>d", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
end)

-- -- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

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

lsp.setup()

local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Insert }

cmp.setup({
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noselect',
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' }
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item(cmp_select_opts)
            else
                cmp.complete()
            end
        end),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        documentation = {
            max_height = 15,
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





-- -- Configure autocomplete
-- local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
--
-- require('luasnip.loaders.from_vscode').lazy_load()
--
-- local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}
--
-- cmp.setup({
--   preselect = 'item',
--   snippet = {
--       expand = function(args)
--           require('luasnip').lsp_expand(args.body)
--       end
--   },
--   window = {
--   },
--   sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       {name = 'luasnip'},
--   }, {
--       { name = 'buffer' },
--   }),
--   enabled = true,
--   completion = { completeopt= "menu,menuone"},
--   mapping = {
--     -- `Enter` key to confirm completion
--     ['<CR>'] = cmp.mapping.confirm({select = true}),
--
--     -- Ctrl+Space to trigger completion menu
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--     ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--    ['<Tab>'] = cmp_action.luasnip_supertab(),
--     ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
--
--     -- Navigate between snippet placeholder
--     -- ['<C-n>'] = cmp_action.luasnip_jump_forward(),
--     -- ['<C-m>'] = cmp_action.luasnip_jump_backward(),
--   }
-- })
