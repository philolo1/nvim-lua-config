-- setup for lua completion
require("neodev").setup()

local lsp = require('lsp-zero').preset("recommended")
local ls = require("luasnip")

local nmap = require("philolo1.helper").nmap;

lsp.setup_servers({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'gopls',
    'astro',
    --    'sqlls',
})

lsp.on_attach(function(_, bufnr)
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
    nmap("<leader>d", function() vim.lsp.buf.definition() end, opts, "go to definition")
    nmap("<leader>f", function() vim.lsp.buf.hover() end, opts, "display information")
    nmap("<leader>r", function() vim.lsp.buf.rename() end, opts, "rename")
    -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    nmap("<leader>a", function() vim.lsp.buf.code_action() end, opts, "do code action")
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
        ['astro'] = { 'astro' },
        -- if you have a working setup with null-ls
        -- you can specify filetypes it can format.
        -- ['null-ls'] = {'javascript', 'typescript'},
    }
})

-- setup loa
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').tsserver.setup {}

lsp.setup()

local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Insert }

local select_next_mapping = cmp.mapping(function()
    if cmp.visible() then
        cmp.select_next_item(cmp_select_opts)
    else
        cmp.complete()
    end
end)


local lspkind = require("lspkind")


require("luasnip.loaders.from_vscode").lazy_load()


cmp.setup({
    enabled = true,
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noselect',
    },
    sources = {
        { name = "luasnip" },
        { name = 'nvim_lsp' },
        {
            name = 'emmet_vim',
            option = {
                filetypes = {
                    'html', 'xml', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'heex',
                    'tsx', 'jsx', 'astro'
                },
            }
        },
        { name = 'nvim_lua' },
        -- { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        -- sql
        { name = 'vim-dadbod-completion' }
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            preset = "codicons",
            maxwidth = 50,
            menu = {
                buffer = "[BUF]",
                nvim_lsp = "[LSP]",
                luasnip = "[SNIP]",
                emmet_vim = "[EMMET]",
                nvim_lua = "[LUA]",
                path = "[PATH]",
                vim_dadbod_completion = "[DADBOD]",

            },
        }),
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
            ls.lsp_expand(args.body)
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

})


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
