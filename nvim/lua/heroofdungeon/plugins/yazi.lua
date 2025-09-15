return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  config = function ()
    vim.keymap.set('n', '<leader>y', ':Yazi toggle<cr>');
  end
}
