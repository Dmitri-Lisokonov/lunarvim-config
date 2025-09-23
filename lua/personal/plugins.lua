-- ~/.config/lvim/config.lua

lvim.plugins = lvim.plugins or {}
vim.list_extend(lvim.plugins, {
  { "towolf/vim-helm" },             -- syntax & ft=helm
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = function() require("mason").setup() end },
  { "williamboman/mason-lspconfig.nvim", config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "helm_ls", "yamlls" }, -- k8s server optional
      }
    end
  },
  { "neovim/nvim-lspconfig", config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      -- YAML LSP => only for plain YAML, never for Helm buffers
      lspconfig.yamlls.setup({
        filetypes = { "yaml" },
        settings = {
          yaml = {
            validate = true,
            completion = true,
            hover = true,
            format = { enable = true },
            kubernetes = true,
            schemaStore = { enable = true },
          },
          redhat = { telemetry = { enabled = false } },
        },
      })

      -- HELM LSP
      lspconfig.helm_ls.setup({
        filetypes = { "helm" },
        root_dir = util.root_pattern("Chart.yaml"),
      })
    end
  },
})

-- Robust Helm filetype detection
local function looks_like_helm(bufnr)
  -- Path match for templates/ or *.tpl/*.gotmpl/*.helm
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name:match("/templates/.*%.ya?ml$") or name:match("%.tpl$") or name:match("%.gotmpl$") or name:match("%.helm$") then
    return true
  end
  -- Heuristic: contains Go templating
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, math.min(200, vim.api.nvim_buf_line_count(bufnr)), false)
  for _, l in ipairs(lines) do
    if l:find("{{") and l:find("}}") then return true end
  end
  return false
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.yaml", "*.yml", "*.tpl", "*.gotmpl", "*.helm" },
  callback = function(args)
    if looks_like_helm(args.buf) then
      vim.bo[args.buf].filetype = "helm"
    end
  end,
})

-- Optional: ensure Treesitter YAML for better highlighting
lvim.builtin.treesitter.ensure_installed = vim.tbl_extend("force", lvim.builtin.treesitter.ensure_installed or {}, { "yaml" })

