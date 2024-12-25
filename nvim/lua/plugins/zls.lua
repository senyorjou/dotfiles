return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          filetypes = { "zig", "zon" },
          settings = {
            zls = {
              enable_autofix = true,
              enable_snippets = false,
              inlay_hints_hide_redundant_param_names = true,
              warn_style = true,
              highlight_global_var_declarations = true,
            },
          },
        },
      },
    },
  },
}
