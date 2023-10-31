return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    local on_attach = function(_, bufnr) -- change _ to client if necessary
      local opts = { buffer = bufnr, silent = true, noremap = true }

      opts.desc = "Rename"
      keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, opts)

      opts.desc = "Code actions"
      keymap.set({ "n", "v" }, "<leader>ca", function()
        vim.lsp.buf.code_action()
      end, opts)

      opts.desc = "Neoclip"
      keymap.set("n", "<leader>cl", "<cmd>Telescope neoclip<CR>", opts)

      opts.desc = "Go to definition"
      keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", function()
        vim.lsp.buf.declaration()
      end, opts)

      opts.desc = "Go to references"
      keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)

      opts.desc = "Go to implementation"
      keymap.set("n", "gI", function()
        vim.lsp.buf.implementation()
      end, opts)

      opts.desc = "Go to type definition"
      keymap.set("n", "gt", function()
        vim.lsp.buf.type_definition()
      end, opts)

      opts.desc = "Document symbols"
      keymap.set("n", "<leader>fy", require("telescope.builtin").lsp_document_symbols, opts)

      opts.desc = "Hover documentation"
      keymap.set("n", "K", function()
        vim.lsp.buf.hover()
      end, opts)

      opts.desc = "Signature documentation"
      keymap.set("n", "gs", function()
        vim.lsp.buf.signature_help()
      end, opts)

      -- opts.desc = "Show LSP implementations"
      -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
      --
      -- opts.desc = "Show LSP type definitions"
      -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "Show diagnostic under cursor"
      keymap.set("n", "<leader>dd", function()
        vim.diagnostic.open_float()
      end, opts)

      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer" })
    end

    -- Broadcast completion capabilities to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure go server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure rust server
    lspconfig["rust_analyzer"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ["rust_analyzer"] = {},
      },
    })

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure typescript server with plugin
    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure svelte server
    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure lua server
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
