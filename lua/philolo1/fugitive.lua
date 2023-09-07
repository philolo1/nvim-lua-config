function OpenGit()
    vim.cmd.Git();
    -- close the half way open window
    vim.cmd(':exe "wincmd j" | q');
end

vim.keymap.set("n", "<leader>g", OpenGit);
