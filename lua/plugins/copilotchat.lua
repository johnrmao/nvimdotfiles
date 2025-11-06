return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "gemini-2.5-pro",
      temperature = 0.1,
      auto_insert_mode = true,
      window = {
        layout = "horizontal",
        width = 0.25,
      },
    },
  },
}
