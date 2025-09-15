return {
  'mason-org/mason.nvim',
  dependencies = {
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require('mason');
    local mason_lspconfig = require('mason-lspconfig');
    local mason_tool_installer = require('mason-tool-installer');

    mason.setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    });

    local lsps = {
      'jdtls',
      'html',
      'lua_ls',
      'pyright',
      'clangd',
      'jsonls',
      'ts_ls',
      'eslint',
      'rust_analyzer',
    };

    mason_lspconfig.setup({
      automatic_installation = true,
      ensure_installed = lsps,
    });

    mason_tool_installer.setup({
      ensure_installed = {
        'pylint',
        'eslint_d',
      },
    });

    for _, lsp in pairs(lsps) do
      vim.lsp.enable(lsp);
    end
  end,
};
