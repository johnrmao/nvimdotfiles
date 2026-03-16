return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",      -- Ctrl+l to accept (no conflict with Tab)
          accept_word = "<C-w>", -- Accept word
          accept_line = false,   -- Disable accept line
          next = "<M-]>",        -- Alt+] for next suggestion
          prev = "<M-[>",        -- Alt+[ for previous suggestion
          dismiss = "<C-]>",     -- Ctrl+] to dismiss
        },
      },
      panel = { enabled = false }, -- Disable panel, use CopilotChat instead
    },
  },
}
