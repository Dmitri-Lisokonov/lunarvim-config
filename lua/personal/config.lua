require("personal.keymaps")

lvim.plugins = lvim.plugins or {}
vim.list_extend(lvim.plugins, require("personal.plugins.extras"))
vim.list_extend(lvim.plugins, require("personal.plugins.windows"))

vim.opt.relativenumber = true
vim.opt.number = true

