return {
  {
    "davidgranstrom/scnvim",
    ft = { "supercollider" }, -- or event = "VeryLazy" if you prefer
    dependencies = {
      -- List any dependencies here if scnvim has them
    },
    opts = {
      -- scnvim specific options here, if any
    },
    config = function()
      local scnvim = require("scnvim")
      local map = scnvim.map
      local map_expr = scnvim.map_expr
      require("scnvim").setup({
        keymaps = {
          ["<M-e>"] = map("editor.send_line", { "i", "n" }),
          ["<C-e>"] = {
            map("editor.send_block", { "i", "n" }),
            map("editor.send_selection", "x"),
          },
          ["<CR>"] = map("postwin.toggle"),
          ["<M-CR>"] = map("postwin.toggle", "i"),
          ["<M-L>"] = map("postwin.clear", { "n", "i" }),
          ["<C-k>"] = map("signature.show", { "n", "i" }),
          ["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
          ["<leader>st"] = map("sclang.start"),
          ["<leader>sk"] = map("sclang.recompile"),
          ["<F1>"] = map_expr("s.boot"),
          ["<F2>"] = map_expr("s.meter"),
        },
      }) -- Initialize scnvim
      -- Any other scnvim configuration or keymaps can go here
      -- vim.keymap.set("n", "<leader>sc", ":SCNvimStart<CR>", { desc = "Start SCNvim" })
      -- vim.keymap.set("n", "<leader>sq", ":SCNvimStop<CR>", { desc = "Stop SCNvim" })
    end,
  },
}
