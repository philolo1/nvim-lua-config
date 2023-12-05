vim.g.mapleader = " "

local nmap = require("philolo1.helper").nmap;
local vmap = require("philolo1.helper").vmap;
local imap = require("philolo1.helper").imap;


-- My own user commands
vim.api.nvim_create_user_command("V", ":e /Users/philolo1/.config/nvim/lua/philolo1/init.lua", {});
vim.api.nvim_create_user_command("S", ":source", {});
vim.api.nvim_create_user_command("H", ":echo 'hi'", {});
vim.api.nvim_create_user_command("F", ":e ~/.config/fish/config.fish", {});
vim.api.nvim_create_user_command("NewTaskFile", ":e Taskfile.yml", {});

vim.cmd('command! -nargs=1 GCheckout :Git checkout -b <args>')

function CreateDefaultTaskfile()
    print("default task file")

    local buf = vim.api.nvim_get_current_buf()

    -- Define the content you'd like to insert
    local content = {
        "version: '3'",
        "",
        "tasks:",
        "  run:",
        "    cmds:",
        "      - go run main.go",
    }

    -- Insert the content into the buffer
    -- The '-1' indicates that the lines should be added at the end of the buffer
    -- '0' is the starting line, '-1' means before the last line in the buffer
    -- If you'd like to insert at the beginning of the buffer, use '0' and '0'
    vim.api.nvim_buf_set_lines(0, 0, 0, false, content)
end

vim.cmd([[
    augroup MyTaskfileGroup
        autocmd!
        autocmd BufNewFile Taskfile.yml :lua CreateDefaultTaskfile()
    augroup END
]])


vim.cmd("command! -bang GoVetShadow call go#lint#Vet(<bang>0, '-vettool=' . go#util#env('gopath') . '/bin/shadow')");
