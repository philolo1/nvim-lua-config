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




-- My own user commands
vim.api.nvim_create_user_command("V", ":e /Users/philolo1/.config/nvim/lua/philolo1/init.lua", {});
vim.api.nvim_create_user_command("S", ":source", {});

vim.api.nvim_create_user_command("H", ":echo 'hi'", {});


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


function MkNonExDir(file, buf)
    if vim.fn.getbufvar(buf, 'buftype') == "" and not string.match(file, "^%w+:/") then
        local dir = vim.fn.fnamemodify(file, ':h')
        local is_dir = vim.fn.isdirectory(dir);
        if is_dir == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end
end

-- Create an autocommand group using vim.api.nvim_command
vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    {
        callback = function()
            local file = vim.fn.expand("<afile>");
            local buffer = vim.fn.expand("<abuf>");
            MkNonExDir(file, buffer);
        end
    }
)
