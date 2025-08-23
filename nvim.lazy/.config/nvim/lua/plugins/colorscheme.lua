if true then return {} end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        float = {
          transparent = true,
          solid = true,
        },
      })

      vim.o.termguicolors = true
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
