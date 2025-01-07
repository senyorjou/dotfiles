return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  commands = {
    Copilot = {
      function()
        require("copilot").start()
      end,
      description = "Start Copilot",
    },
  },
  opts = {
    suggestion = { enabled = true },
    panel = { enabeld = true },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
