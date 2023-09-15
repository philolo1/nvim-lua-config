vim.g.mapleader = " "

local nmap = require("philolo1.helper").nmap;
local vmap = require("philolo1.helper").vmap;
local imap = require("philolo1.helper").imap;


-- My own user commands
vim.api.nvim_create_user_command("V", ":e /Users/philolo1/.config/nvim/lua/philolo1/init.lua", {});
vim.api.nvim_create_user_command("S", ":source", {});
vim.api.nvim_create_user_command("H", ":echo 'hi'", {});
