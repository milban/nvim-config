vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.pick", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.completion", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.pairs", version = "stable" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/olimorris/codecompanion.nvim", version = "v19.26.0" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})
require("mini.pick").setup()
require("mini.completion").setup()
require("mini.pairs").setup()
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
