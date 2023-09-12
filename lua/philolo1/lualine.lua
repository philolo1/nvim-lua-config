require('lualine').setup(
    {
        sections = {
            lualine_a = {
                {
                    'mode'
                },
                {
                    'filename',
                    file_status = true, -- displays file status (readonly status, modified status)
                    path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
                }
            },
            lualine_c = {
                'lsp_progress'
            },

        }
    }
)
