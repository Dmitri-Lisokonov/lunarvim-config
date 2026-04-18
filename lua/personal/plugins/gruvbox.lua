return {
  {
    url = "https://gitlab.com/motaz-shokry/gruvbox.nvim.git",
    name = "gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
    end,
  },
}
