return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- Fix: Add proper Mason setup
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_outdated_servers = "C",
          update_all_servers = "U",
          quit = "q",
        },
      },
    })

    -- Fix: Configure LSP servers with proper settings
    mason_lspconfig.setup({
      automatic_installation = true,
      ensure_installed = {
        "html",
        "lua_ls",
        "pyright",
        "clangd",
        "jsonls",
        "ts_ls", -- Changed from ts_ls to tsserver
        "eslint",
      },
    })

    -- Fix: Add more useful tools
    mason_tool_installer.setup({
      ensure_installed = {
        "pylint",
        "stylua", -- Added Lua formatter
      },
    })
  end,
}
