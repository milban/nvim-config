vim.opt.termguicolors = true

require("mini.bufremove").setup()

local function close_buffer(bufnr)
  -- 창 배치를 유지하며 닫고, 저장하지 않은 변경은 강제로 버리지 않습니다.
  require("mini.bufremove").delete(bufnr, false)
end

require("bufferline").setup({
  options = {
    mode = "buffers",
    always_show_bufferline = true,
    close_command = close_buffer,
    right_mouse_command = close_buffer,
    show_close_icon = false,
    offsets = {
      {
        filetype = "neo-tree",
        text = "파일 탐색기",
        text_align = "left",
        separator = true,
      },
    },
  },
})

vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>", {
  desc = "이전 버퍼로 이동합니다",
})
vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>", {
  desc = "다음 버퍼로 이동합니다",
})
vim.keymap.set("n", "<leader>bd", function()
  close_buffer(0)
end, {
  desc = "창 배치를 유지하며 현재 버퍼를 닫습니다",
})
