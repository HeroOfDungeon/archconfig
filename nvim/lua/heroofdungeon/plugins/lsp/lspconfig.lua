return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'nvim-telescope/telescope.nvim',
        { 'antosha417/nvim-lsp-file-operations', config = true },
        { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
        local diagnostics_active = false;

        local keymap = vim.keymap;

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function()
                keymap.set('n', 'gD', ':Telescope lsp_references<cr>');
                keymap.set('n', 'gd', vim.lsp.buf.declaration);
                keymap.set('n', 'gt', ':Telescope lsp_type_definitions<cr>');
                keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action);
                keymap.set('n', '<leader>rn', vim.lsp.buf.rename);
                keymap.set('n', '<leader>Dt', function()
                    diagnostics_active = not diagnostics_active;
                    vim.diagnostic.config({
                        virtual_text = diagnostics_active,
                    });
                end)
                keymap.set('n', 'K', function()
                    vim.lsp.buf.hover({
                        border = 'rounded',
                    });
                end);
                keymap.set('n', '<leader>rs', ':LspRestart<cr>')
            end,
        });

        vim.diagnostic.config({
            virtual_text = diagnostics_active,
            underline = true,
            update_in_insert = false,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.HINT] = '󰠠 ',
                    [vim.diagnostic.severity.INFO] = ' ',
                },
            },
        });
    end,
};
