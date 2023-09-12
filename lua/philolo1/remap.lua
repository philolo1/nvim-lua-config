vim.g.mapleader = " "

local nmap = require("philolo1.helper").nmap;
local vmap = require("philolo1.helper").vmap;

-- expand %% to path in command line
vim.cmd("cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'")

-- Define the function to open init.lua file
function OpenInitLazy()
    vim.cmd("e ~/.config/nvim/lua/philolo1/lazy.lua")
    vim.cmd("cd ~/.config/nvim/lua/")
end

-- Map Ctrl-i to the openInitLua function in normal mode
nmap('<C-i>', OpenInitLazy, { noremap = true, silent = true }, "open lazy.lua")
nmap('<leader>i', OpenInitLazy, { noremap = true, silent = true }, "open lazy.lua")

-- Map ' to save
nmap("'", ":wa<CR>", { noremap = true }, "Save file")
nmap("<leader>q", ":bd<CR>", { noremap = true }, "Delete buffer")
nmap("<C-q>", ":bd<CR>", { noremap = true }, "Delete buffer")

nmap("J", "}", {}, "move down")
nmap("K", "{", {}, "move up")

vmap("J", "}", {}, "move paragraph down")
vmap("K", "{", {}, "move paragraph up")


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


nmap('<leader>y', '"ayy', { noremap = true }, "copy line to register a");
nmap('<leader>p', '"aP', { noremap = true }, "paste line from register a");
