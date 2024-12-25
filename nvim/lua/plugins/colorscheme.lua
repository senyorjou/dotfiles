return {
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  -- priority = 1000,
  -- opts = {
  --   flavour = "latte",
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin-latte",
  --   },
  -- },
  --
  -- add tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "day",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
