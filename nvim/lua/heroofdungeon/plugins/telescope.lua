return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require('telescope');
    telescope.load_extension('fzf');

    local keymap = vim.keymap;

    keymap.set('n', '<leader>f', ':Telescope find_files<cr>'); -- Find Files
    --keymap.set('n', '<leader>fg', ':Telescope git_files<cr>');
    keymap.set('n', '<leader>w', ':Telescope live_grep<cr>'); -- Find Contents
    --keymap.set('n', '<leader>fs', ':Telescope grep_string<cr>'); -- Find
    --keymap.set('n', '<leader>fe', ':Telescope lsp_document_symbols<cr>');
    keymap.set('n', '<leader>c', ':Telescope colorscheme<cr>');
  end,
};
