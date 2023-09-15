local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        init = function()
            vim.cmd('colorscheme rose-pine')
            vim.opt.background = "dark";
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'WhoIsSethDaniel/lualine-lsp-progress.nvim'
        },
    },
    { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-lua/plenary.nvim' },
    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'mbbill/undotree',
    -- lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
    { "folke/neodev.nvim", opts = {} },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        lazy = false,
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    "ray-x/lsp_signature.nvim",

    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        init = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true
            require("nvim-tree").setup()
        end
    },
    'hrsh7th/cmp-path',
    'neovim/nvim-lspconfig',
    'simrat39/rust-tools.nvim',
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
    -- Git basics
    'tpope/vim-fugitive',
    -- Git ui
    'idanarye/vim-merginal',
    -- terminal
    {
        "NvChad/nvterm",
        init = function()
            require("nvterm").setup()
        end
    },
    -- emmet completion
    {
        'dcampos/cmp-emmet-vim',
        dependencies = { 'mattn/emmet-vim' }
    },
    -- plugin that shows key shortcuts that you defined
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        "natecraddock/workspaces.nvim",
        init = function()
            require("workspaces").setup()
        end
    },
    {
        "natecraddock/sessions.nvim",
        init = function()
            require("sessions").setup()
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        dev = true,
        init = function()
            require('gitsigns').setup()
        end
    },
    "tpope/vim-surround",
    -- {
    --     'shaunsingh/solarized.nvim',
    --     init = function()
    --         require('solarized').set()
    --         vim.cmd("colorscheme solarized");
    --         vim.opt.background = "light";
    --     end
    -- },
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {},
    }
}


local opts = {
    dev = {
        -- directory where you store your local plugin projects
        path = "~/code",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {},    -- For example {"folke"}
        fallback = false, -- Fallback to git when local plugin doesn't exist
    },
}

require("lazy").setup(plugins, opts)
