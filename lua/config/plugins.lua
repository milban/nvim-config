vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.pick", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.completion", version = "stable" },
})
require("mini.pick").setup()
require("mini.completion").setup()

vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", {
  desc = "mini.pick files",
})
