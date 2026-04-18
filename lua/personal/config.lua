require("personal.keymaps")

lvim.plugins = lvim.plugins or {}
table.insert(lvim.plugins, {
  "akinsho/bufferline.nvim",
  version = "v4.6.1",
})
table.insert(lvim.plugins, {
  "nvimtools/none-ls.nvim",
  branch = "main",
})
table.insert(lvim.plugins, {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
})
vim.list_extend(lvim.plugins, require("personal.plugins.gruvbox"))
vim.list_extend(lvim.plugins, require("personal.plugins.windows"))
lvim.colorscheme = "gruvbox"
lvim.builtin.illuminate.active = false
lvim.builtin.treesitter.auto_install = false
lvim.builtin.treesitter.highlight = {
  enable = true,
  disable = { "checkhealth", "help", "markdown", "markdown_inline", "vimdoc" },
  additional_vim_regex_highlighting = { "checkhealth", "help", "markdown", "markdown_inline", "vimdoc" },
}
vim.opt.relativenumber = true
vim.opt.number = true

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*/templates/*.yaml",
    "*/templates/*.yml",
    "*/templates/*.tpl",
    "*/templates/*.txt",
    "*/charts/*/templates/*.yaml",
    "*/charts/*/templates/*.yml",
    "*/charts/*/templates/*.tpl",
  },
  callback = function()
    vim.bo.filetype = "helm"
  end,
})
