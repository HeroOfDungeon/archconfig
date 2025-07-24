return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    local diagnostics_active = false

    local keymap = vim.keymap

    -- Fix: Properly configure capabilities first
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- Keymaps remain unchanged as they work correctly
        opts.desc = "Show LSP references"
        keymap.set("n", "gD", "<cmd>Telescope lsp_references<cr>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gd", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Toggle virtual text"
        keymap.set("n", "<leader>Dt", function()
          diagnostics_active = not diagnostics_active
          vim.diagnostic.config({
            virtual_text = diagnostics_active,
          })
        end, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>Df", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", function()
          vim.lsp.buf.hover({
            border = "rounded",
          })
        end, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<cr>", opts)
      end,
    })

    -- Fix: Initialize lua_ls with proper capabilities
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            enable = true,
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    })

    -- Fix: Set up proper diagnostic config
    vim.diagnostic.config({
      virtual_text = diagnostics_active,
      underline = true,
      update_in_insert = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    })
  end,
}
