local config_dir = vim.fn.stdpath("config")
local guides = {
  {
    command = "VimLanguage",
    key = "<leader>vl",
    file = "vim-language.md",
    desc = "Vim 편집 언어 학습 문서를 엽니다",
  },
  {
    command = "LspHelp",
    key = "<leader>lh",
    file = "lsp-keymaps.md",
    desc = "LSP 단축키 문서를 엽니다",
  },
  {
    command = "BufferHelp",
    key = "<leader>bh",
    file = "buffer-jumps.md",
    desc = "버퍼와 점프 단축키 문서를 엽니다",
  },
}

local function open_guide(path)
  vim.cmd("botright vsplit " .. vim.fn.fnameescape(path))
end

for _, guide in ipairs(guides) do
  local path = config_dir .. "/docs/" .. guide.file

  vim.api.nvim_create_user_command(guide.command, function()
    open_guide(path)
  end, {
    desc = guide.desc,
  })

  vim.keymap.set("n", guide.key, "<cmd>" .. guide.command .. "<CR>", {
    desc = guide.desc,
  })
end
