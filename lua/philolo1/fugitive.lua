function OpenGit()
    vim.cmd.Git();
    -- close the half way open window
    vim.cmd(':exe "wincmd j" | q');
end

vim.keymap.set("n", "<leader>g", OpenGit);
vim.keymap.set("n", "<C-g>", OpenGit);
vim.keymap.set("n", "<leader>b", ":Git branch<CR>");

-- change branch easily
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = "git",
        callback = function()
            print("buffer read git")
            vim.keymap.set("n", "<leader>c", ChangeBranch, { buffer = true });
        end,
    }
);


function ChangeBranch()
    local word = vim.fn.expand("<cWORD>");
    local current_buf = vim.api.nvim_get_current_buf();
    print("current buffer", current_buf);

    print(word);
    vim.cmd("Git checkout " .. word);
    vim.cmd("Git branch");
    vim.cmd(":bdelete " .. current_buf);
end
