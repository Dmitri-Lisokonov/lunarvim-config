return {
  {
    "https://gitlab.com/motaz-shokry/gruvbox.nvim.git",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
    end,
  },
}
