local nmap = require("philolo1.helper").nmap;

nmap("<leader>u", vim.cmd.UndotreeToggle, {}, "open undo tree")
