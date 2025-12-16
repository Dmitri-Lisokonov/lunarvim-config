lvim.keys.normal_mode["<leader>bd"] = ":cd -<CR>:pwd<CR>"

lvim.builtin.which_key.mappings["b"] = lvim.builtin.which_key.mappings["b"] or { name = "Buffers" }
lvim.builtin.which_key.mappings["b"]["d"] = { ":cd -<CR>:pwd<CR>", "Back Directory" }

