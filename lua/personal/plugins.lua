-- Plugins for Helm syntax & LSP
lvim.plugins = {
  { "towolf/vim-helm" }, -- Helm syntax
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "helm_ls", "kubernetes", "yamlls" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Helm LSP
      lspconfig.helm_ls.setup {}

      -- Kubernetes LSP
      lspconfig.kubernetes.setup {}

      -- YAML LSP with Kubernetes schemas
      lspconfig.yamlls.setup {
        settings = {
          yaml = {
            validate = true,
            hover = true,
            completion = true,
            kubernetes = true,
            schemaStore = { enable = true },
          },
          redhat = { telemetry = { enabled = false } },
        },
      }
    end,
  },
}
