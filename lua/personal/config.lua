require("personal.keymaps")

lvim.plugins = lvim.plugins or {}
vim.list_extend(lvim.plugins, require("personal.plugins.windows"))
lvim.builtin.telescope.defaults.hidden = true
lvim.builtin.telescope.defaults.no_ignore = true
vim.opt.relativenumber = true
vim.opt.number = true

lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "^.git/",
}

lvim.builtin.nvimtree.setup.filters = {
  dotfiles = false,
}

lvim.builtin.nvimtree.setup.git = {
  ignore = false,
}

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


