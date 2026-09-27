vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.pick", version = "stable" },
})
require("mini.pick").setup()

vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<CR>", {
  desc = "mini.pick files",
})

local config_dir = vim.fn.stdpath("config")
local guide_paths = {
  vim_language = config_dir .. "/docs/vim-language.md",
  lsp_keymaps = config_dir .. "/docs/lsp-keymaps.md",
  buffer_jumps = config_dir .. "/docs/buffer-jumps.md",
}

local function open_guide(path)
  vim.cmd("botright vsplit " .. vim.fn.fnameescape(path))
end

vim.api.nvim_create_user_command("VimLanguage", function()
  open_guide(guide_paths.vim_language)
end, {
  desc = "Vim 편집 언어 학습 문서를 엽니다",
})

vim.keymap.set("n", "<leader>vl", "<cmd>VimLanguage<CR>", {
  desc = "Vim 편집 언어 학습 문서를 엽니다",
})

vim.api.nvim_create_user_command("LspHelp", function()
  open_guide(guide_paths.lsp_keymaps)
end, {
  desc = "LSP 단축키 문서를 엽니다",
})

vim.keymap.set("n", "<leader>lh", "<cmd>LspHelp<CR>", {
  desc = "LSP 단축키 문서를 엽니다",
})

vim.api.nvim_create_user_command("BufferHelp", function()
  open_guide(guide_paths.buffer_jumps)
end, {
  desc = "버퍼와 점프 단축키 문서를 엽니다",
})

vim.keymap.set("n", "<leader>bh", "<cmd>BufferHelp<CR>", {
  desc = "버퍼와 점프 단축키 문서를 엽니다",
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("tsc")

vim.diagnostic.config({
  virtual_text = true,
})
