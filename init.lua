vim.g.mapleader = " "

local config_dir = vim.fn.stdpath("config")
local guide_path = config_dir .. "/docs/vim-language.md"

vim.api.nvim_create_user_command("VimLanguage", function()
  vim.cmd("botright vsplit " .. vim.fn.fnameescape(guide_path))
end, {
  desc = "Vim 편집 언어 학습 문서를 엽니다",
})

vim.keymap.set("n", "<leader>vl", "<cmd>VimLanguage<CR>", {
  desc = "Vim 편집 언어 학습 문서를 엽니다",
})

vim.lsp.enable("lua_ls")

vim.diagnostic.config({
  virtual_text = true,
})
