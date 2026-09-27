vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.pick", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.completion", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.pairs", version = "stable" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/kdheepak/lazygit.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3") },
  { src = "https://github.com/olimorris/codecompanion.nvim", version = "v19.26.0" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})
require("mini.pick").setup()
require("mini.completion").setup()
require("mini.pairs").setup()
require("neo-tree").setup({
  window = {
    position = "left",
    width = 32,
  },
  filesystem = {
    follow_current_file = { enabled = true },
  },
})
require("render-markdown").setup({
  file_types = { "markdown", "codecompanion" },
  on = {
    attach = function(ctx)
      -- Neovim에 포함된 Markdown 파서로 구문 강조를 활성화합니다.
      vim.treesitter.start(ctx.buf)
    end,
  },
})

vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", {
  desc = "mini.pick files",
})
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal<CR>", {
  desc = "Toggle file tree",
})
