vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.pick", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.completion", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.pairs", version = "stable" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/olimorris/codecompanion.nvim", version = "v19.26.0" },
})
require("mini.pick").setup()
require("mini.completion").setup()
require("mini.pairs").setup()

vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", {
  desc = "mini.pick files",
})
