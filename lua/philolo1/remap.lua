vim.g.mapleader = " "

local nmap = require("philolo1.helper").nmap;
local vmap = require("philolo1.helper").vmap;
local imap = require("philolo1.helper").imap;
local cmap = require("philolo1.helper").cmap;

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
nmap("'", ":w<CR>", { noremap = true }, "Save file")
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


vim.cmd(":command! -bar -nargs=0 RunDBUISaveQuery call feedkeys(\"<Plug>(DBUI_SaveQuery)\", 'n')");


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

nmap('Y', 'yyp', { noremap = true }, "copy current line and paste it below");

nmap('<leader>z', 'za', { noremap = true }, "trigger fold");
nmap('<leader>o', '<c-o>', { noremap = true }, "go back one file");
imap('<c-l>', function()
    vim.cmd(":normal!i<leader>");
    vim.cmd(":startinsert!");
end, { noremap = true }, "insert leader character");

nmap('<leader>v', function()
    if (#vim.api.nvim_tabpage_list_wins(0) >= 2) then
        vim.cmd("wincmd w");
    else
        vim.cmd("vsplit");
    end
end, {}, "split visual mode or move around");


nmap('<leader>q', function()
    vim.cmd('source');
    local filepath = vim.fn.expand('%:p') -- Get the full path of the current file
    print("Sourced lua file: " .. filepath);
end, { noremap = true }, "reload file");


cmap('<c-a>', '<Home>', { noremap = true }, "go to beginning of the line");

nmap('<leader>m', 'ma', { noremap = true }, "mark something");
nmap('<leader>n', "'a", { noremap = true }, "go to mark");


nmap('<leader>cd', function()
    local folder = vim.fn.expand('%:h') .. '/'
    local command = string.format(":cd %s", folder);
    -- print(vim.inspect(command))
    vim.cmd(command);
end, { noremap = true }, "set current folder as directory")
