local nmap = require("philolo1.helper").nmap;

function OpenGit()
    vim.cmd.Git();
    -- close the half way open window
    vim.cmd(':exe "wincmd j" | q');
end

nmap("<leader>gg", OpenGit, {}, "open git");
nmap("<C-g>", OpenGit, {}, "open git")
nmap("<leader>gb", ":Git branch<CR>", {}, "open branch");




function ChangeBranch()
    local word = vim.fn.expand("<cWORD>");
    local current_buf = vim.api.nvim_get_current_buf();
    print("current buffer", current_buf);

    print(word);
    vim.cmd("Git checkout " .. word);
    vim.cmd("Git branch");
    vim.cmd(":bdelete " .. current_buf);
end

function Split(str, delimiter)
    local result = {}
    for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end

function DeleteFile()
    local path = vim.fn.getline(".");
    local arr = Split(path, " ")
    path = arr[#arr]

    local command = string.format(":!rm -rf %s", path);
    print(vim.inspect(command))
    vim.cmd(command);
end

-- change branch easily
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = "git",
        callback = function()
            print("buffer read git")
            nmap("<leader>c", ChangeBranch, { buffer = true }, "change branch");
        end,
    }
);

-- delete file
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = "fugitive",
        callback = function()
            nmap("<leader>d", DeleteFile, { buffer = true }, "delete file under cursor");
        end,
    }
);
