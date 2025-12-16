require("personal.keymaps")

lvim.plugins = lvim.plugins or {}
vim.list_extend(lvim.plugins, require("personal.plugins.windows"))

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


