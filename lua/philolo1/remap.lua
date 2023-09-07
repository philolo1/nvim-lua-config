vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.cmd("cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'")

-- Define the function to open init.lua file
function OpenInitLazy()
    vim.cmd("e ~/.config/nvim/lua/philolo1/lazy.lua")
end

-- Map Ctrl-i to the openInitLua function in normal mode
vim.keymap.set('n', '<C-i>', OpenInitLazy, { noremap = true, silent = true })

-- Map ' to save
vim.keymap.set('n', "'", ":wa<CR>", { noremap = true })


vim.keymap.set("n", "J", "}")
vim.keymap.set("n", "K", "{")
vim.keymap.set("v", "J", "}")
vim.keymap.set("v", "K", "{")

function OpenDiagnostics()
    vim.cmd(":lua vim.diagnostic.setloclist()");
end

-- Open error menu after safe
vim.api.nvim_create_autocmd(
    { "BufWritePost" },
    {
        callback = OpenDiagnostics,
    }
);
